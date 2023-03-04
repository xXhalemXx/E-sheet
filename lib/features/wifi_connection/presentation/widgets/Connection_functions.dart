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

  void onConnectionInit(String id, ConnectionInfo info) async {

    if (attended(info)==false && rolledIn(info, id) ) {
      getIt<ConnectionCubit>().reloadConnectedStudents(connectedStudents);
      Nearby().acceptConnection(
        id,
        onPayLoadRecieved: (_, payload) {},
        onPayloadTransferUpdate: (_, payloadTransferUpdate) {},
      );

      await Future.delayed(const Duration(microseconds: 200));
      Nearby().disconnectFromEndpoint(id);
      connectedStudents.remove(id);
      getIt<ConnectionCubit>().reloadConnectedStudents(connectedStudents);
    } else {
      Nearby().rejectConnection(id);
    }
  }

  //in this fun we see if student rolled in this course
  //if yes he will add his info to temp list so he can't roll in more than one time
  bool rolledIn(ConnectionInfo info, String id) {
    bool exist = false;
    String studentInfo =info.endpointName;
    int studentId = int.parse(studentInfo.substring(0,14));
    int studentIMEI = int.parse(studentInfo.substring(15));
    for (var student in allStudents) {
      if (studentId == student['nationalId']) {
        attendedStudents.add(student);
        attendedIMEI.add(studentIMEI);
        connectedStudents[id] = student['name'];
        exist = true;
        break;
      }
    }
    return exist;
  }

  bool attended(ConnectionInfo info){
    bool result=false;
    String studentInfo =info.endpointName;
     int studentId = int.parse(studentInfo.substring(0,14));
     int studentIMEI = int.parse(studentInfo.substring(15));
     for(int IMEI in attendedIMEI){
       if(IMEI == studentIMEI) {
         result=true;
         break;
       }
     }
    for(var student in attendedStudents){
      if(studentId == student['nationalId']){
        result =true;
        break;
      }

    }
    return result;
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

}


