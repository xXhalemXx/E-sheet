import 'dart:typed_data';

import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/save_data_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';


class ConnectionFunctions {
  final Strategy strategy = Strategy.P2P_POINT_TO_POINT;
  List<Map<String,dynamic>> attendedStudents = [];
  List<Map<String, dynamic>> allStudents = [];
  List<int> attendedIMEI=[];
  Map<String, String> connectedStudents = {};
  late String course;


  Future<bool> startConnection(String courseName) async {
    course=courseName;
    allStudents = await getIt<StudentsCubit>().getAllStudents(courseName);
    bool value = false;
    try {
      bool activated = await Nearby().startAdvertising(courseName, strategy,
          onConnectionInitiated: onConnectionInit,
          onConnectionResult: (id, status) {},
          onDisconnected: (id) {
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
    showDialog(context: context, builder: (_){
      return SaveData(attendedStudents: attendedStudents, courseName: course);
    });
  }

  //status codes 0-> student attended
  //status codes 1-> student not rolled in this class
  //status codes 2-> student already attended
  //status codes 3-> student used this device to attend
  void onConnectionInit(String id, ConnectionInfo info) async {
    Nearby().acceptConnection(
      id,
      onPayLoadRecieved: (_, payload) {},
      onPayloadTransferUpdate: (_, payloadTransferUpdate) {},
    );

    if (rolledIn(info, id)) {
      if(!attended(info)) {
        if (!usedSameDevice(info)){
          addStudentInfo(info, id);
          getIt<ConnectionCubit>().reloadConnectedStudents(connectedStudents);
          Nearby().sendBytesPayload(id, Uint8List.fromList('0'.codeUnits));
          Nearby().disconnectFromEndpoint(id);
        }else{
          Nearby().sendBytesPayload(id, Uint8List.fromList('3'.codeUnits));
          Nearby().disconnectFromEndpoint(id);
        }
      }else{
        Nearby().sendBytesPayload(id, Uint8List.fromList('2'.codeUnits));
        Nearby().disconnectFromEndpoint(id);
      }
    } else {
      Nearby().sendBytesPayload(id, Uint8List.fromList('1'.codeUnits));
      await Future.delayed(const Duration(seconds: 1));
      Nearby().sendBytesPayload(id, Uint8List.fromList('1'.codeUnits));
      Nearby().disconnectFromEndpoint(id);
    }
  }

  //in this fun we see if student rolled in this course
  //if yes he will add his info (student id , phone IMEI) to temp list so he can't roll in more than one time
  bool rolledIn(ConnectionInfo info, String id) {
    bool result = false;
    String studentInfo =info.endpointName;
    int studentId = int.parse(studentInfo.substring(0,4));
    for (var student in allStudents) {
      print('$student---->$studentId');
      if (studentId == student['nationalId']) {
        result = true;
        break;
      }
    }
    return result;
  }

  bool attended(ConnectionInfo info){
    bool result=false;
    String studentInfo =info.endpointName;
    int studentId = int.parse(studentInfo.substring(0,4));
    for(var student in attendedStudents){
      if(studentId == student['nationalId']){
        result =true;
        break;
      }

    }
    return result;
  }

  void addStudentInfo(ConnectionInfo info, String id) {
    String studentInfo = info.endpointName;
    int studentId = int.parse(studentInfo.substring(0, 4));
    int studentIMEI = int.parse(studentInfo.substring(5));
    attendedIMEI.add(studentIMEI);
    for (var student in allStudents) {
      if (studentId == student['nationalId']) {
        attendedStudents.add(student);
        connectedStudents[id] = student['name'];
        break;
      }
    }
  }

  bool usedSameDevice(ConnectionInfo info){
    bool result=false;
    String studentInfo =info.endpointName;
     int studentIMEI = int.parse(studentInfo.substring(5));
     for(int IMEI in attendedIMEI){
       if(IMEI == studentIMEI) {
         result=true;
         break;
       }
    }
     return result;
  }


}


