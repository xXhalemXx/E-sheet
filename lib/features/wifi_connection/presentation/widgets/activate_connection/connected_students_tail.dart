
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';

class ConnectedStudentsTail extends StatelessWidget {
  final String studentName;
  final String studentId;
  const ConnectedStudentsTail({Key? key,required this.studentId,required this.studentName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        tileColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: AutoSizeText(
            "${AllTexts.name}: $studentName",
            maxLines: 1,
          ),
        ),
        subtitle: const Text(AllTexts.isConnected),
        trailing: IconButton(
          onPressed: () {
            Nearby().disconnectFromEndpoint(studentId);
              getIt<ConnectionFunctions>().connectedStudents.remove(studentId);
              getIt<ConnectionCubit>().reloadConnectedStudents(getIt<ConnectionFunctions>().connectedStudents);
          },
          icon: const Icon(Icons.delete),
          splashColor: Colors.red,
          splashRadius: 25,
        ),
      ),
    );
  }
}
