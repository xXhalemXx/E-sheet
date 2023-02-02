import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:flutter/material.dart';

class DeleteStudentDialog extends StatelessWidget {

  final Map<String,dynamic> student;

  const DeleteStudentDialog(
      {super.key,required this.student});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        AllTexts.yes,
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () {
        deleteStudentButton(context);
      },
    );
  }

  deleteStudentButton(BuildContext context) {
    getIt<ConnectionFunctions>().attendedStudents.remove(student);
    getIt<ConnectionCubit>().reloadModifiedStudents(getIt<ConnectionFunctions>().attendedStudents);
    Navigator.of(context).pop();
  }
}
