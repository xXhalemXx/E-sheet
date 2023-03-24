import 'dart:typed_data';

import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/save_data_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';

class ConnectionFunctions {
  final Strategy strategy = Strategy.P2P_POINT_TO_POINT;
  List<Map<String, dynamic>> attendedStudents = [];
  List<Map<String, dynamic>> allStudents = [];
  List<Map<String, dynamic>> allStudentsInThisDay = [];
  List<int> attendedIMEI = [];
  Map<String, String> connectedStudents = {};
  late String course;

  Future<bool> startConnection(String courseName) async {
    course = courseName;
    allStudents = await getIt<StudentsCubit>().getAllStudents(courseName);
    allStudentsInThisDay = await getIt<StudentsDateCubit>()
        .getAllStudents('${courseName}WithDate');
    bool value = false;
    try {
      bool activated = await Nearby().startAdvertising(courseName, strategy,
          onConnectionInitiated: onConnectionInit,
          onConnectionResult: (id, status) {}, onDisconnected: (id) {
        connectedStudents.remove(id);
        getIt<ConnectionCubit>().reloadConnectedStudents(connectedStudents);
      });
      value = activated;
    } catch (exception) {
      // snackBarFunction(exception, Colors.red,context);
    }
    return value;
  }

  Future<void> stopConnection(BuildContext context) async {
    await Nearby().stopAdvertising();
    await Nearby().stopAllEndpoints();
    connectedStudents.clear();
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (_) {
          return SaveData(
              attendedStudents: attendedStudents, courseName: course);
        });
  }

  //status codes 0-> student attended
  //status codes 1-> student not rolled in this class
  //status codes 2-> student already attended
  //status codes 3-> student used this device to attend
  void onConnectionInit(String id, ConnectionInfo info) async {
    Nearby().acceptConnection(
      id,
      onPayLoadRecieved: (endpointId, payload) async {
        String str = String.fromCharCodes(payload.bytes!);
        if (int.parse(str) == 0 ||
            int.parse(str) == 1 ||
            int.parse(str) == 2 ||
            int.parse(str) == 3) {
          Nearby().disconnectFromEndpoint(endpointId);
        } else {
          sendRespond(id, info);
        }
      },
    );
  }

  //in this fun we see if student rolled in this course
  //if yes he will add his info (student id , phone IMEI) to temp list so he can't roll in more than one time
  bool rolledIn(ConnectionInfo info, String id) {
    bool result = false;
    String studentInfo = info.endpointName;
    int studentId = int.parse(studentInfo.substring(15));
    for (var student in allStudents) {
      if (studentId == student['nationalId']) {
        result = true;
        break;
      }
    }
    return result;
  }

  List<int> getAllStudents(
      final int date, List<Map<String, dynamic>> studentsDate) {
    List<int> allStudentsNum = [];
    for (var student in studentsDate) {
      if (student['date'] == date) {
        allStudentsNum.add(student['nationalId']);
      }
    }
    return allStudentsNum;
  }

  bool attended(ConnectionInfo info) {
    final DateTime dateAndTime = DateTime.now();
    final DateTime dateOnly =
        DateTime(dateAndTime.year, dateAndTime.month, dateAndTime.day);
    final int dateAsInt = dateOnly.millisecondsSinceEpoch;
    List studentsAttendedInThisDay =
        getAllStudents(dateAsInt, allStudentsInThisDay);
    String studentInfo = info.endpointName;
    int studentId = int.parse(studentInfo.substring(15));
    for (var student in attendedStudents) {
      if (studentId == student['nationalId']) {
        return true;
      }
    }
    for (var student in studentsAttendedInThisDay) {
      if (studentId == student) {
        return true;
      }
    }
    return false;
  }

  void addStudentInfo(ConnectionInfo info, String id) {
    String studentInfo = info.endpointName;
    int studentId = int.parse(studentInfo.substring(15));
    int studentIMEI = int.parse(studentInfo.substring(0, 15));
    attendedIMEI.add(studentIMEI);
    for (var student in allStudents) {
      if (studentId == student['nationalId']) {
        attendedStudents.add(student);
        connectedStudents[id] = student['name'];
        break;
      }
    }
  }

  void removeStudentInfo(ConnectionInfo info, String id) {
    String studentInfo = info.endpointName;
    int studentId = int.parse(studentInfo.substring(15));
    int studentIMEI = int.parse(studentInfo.substring(0, 15));
    attendedIMEI.remove(studentIMEI);
    for (var student in allStudents) {
      if (studentId == student['nationalId']) {
        attendedStudents.remove(student);
        connectedStudents.remove({id: student['name']});
        break;
      }
    }
  }

  bool usedSameDevice(ConnectionInfo info) {
    bool result = false;
    String studentInfo = info.endpointName;
    int studentIMEI = int.parse(studentInfo.substring(0, 15));
    for (int IMEI in attendedIMEI) {
      if (IMEI == studentIMEI) {
        result = true;
        break;
      }
    }
    return result;
  }

  void sendRespond(String id, ConnectionInfo info) async {
    if (rolledIn(info, id)) {
      if (!attended(info)) {
        if (!usedSameDevice(info)) {
          addStudentInfo(info, id);
          getIt<ConnectionCubit>().reloadConnectedStudents(connectedStudents);
          await Nearby()
              .sendBytesPayload(id, Uint8List.fromList('0'.codeUnits));
        } else {
          await Nearby()
              .sendBytesPayload(id, Uint8List.fromList('3'.codeUnits));
        }
      } else {
        await Nearby().sendBytesPayload(id, Uint8List.fromList('2'.codeUnits));
      }
    } else {
      await Nearby().sendBytesPayload(id, Uint8List.fromList('1'.codeUnits));
    }
  }
}
