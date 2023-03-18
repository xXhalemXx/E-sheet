import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
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

  deleteStudentButton(BuildContext context,[bool mounted = true]) async{
   var allStudents= await getIt<StudentsDateCubit>().showStudents('${courseName}WithDate');
   for(var student in allStudents){
     if(studentNationalId ==student['nationalId']) {
       getIt<StudentsDateCubit>().deleteStudent(
           '${courseName}WithDate', student['date'], studentNationalId);
     }
   }
    getIt<StudentsCubit>().deleteStudent(courseName, studentNationalId);
   if (!mounted) return;
    Navigator.of(context).pop();
  }
}
