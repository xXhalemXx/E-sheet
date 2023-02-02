import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';

class DeleteStudentDialog extends StatelessWidget {
  final String courseName;
  final String studentName;
  final int studentNationalId;

  const DeleteStudentDialog(
      {super.key,
      required this.studentNationalId,
      required this.courseName,
      required this.studentName});

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
    getIt<StudentsCubit>().deleteStudent(courseName, studentNationalId);
    Navigator.of(context).pop();
  }
}
