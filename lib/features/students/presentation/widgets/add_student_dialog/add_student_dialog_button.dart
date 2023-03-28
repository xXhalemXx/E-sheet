import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';

class AddStudentDialogButton extends StatelessWidget {
  final GlobalKey<FormState> formKey ;
  final TextEditingController studentName ;
  final TextEditingController studentNationalId ;
  final String courseName;
  const AddStudentDialogButton({super.key,required this.formKey,required this.studentName,required this.studentNationalId,required this.courseName});



  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        addNewStudent(context);
      },
      child: const Text(
        AllTexts.add,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }

  addNewStudent(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (chekIfStudentIdExist(
          int.parse(studentNationalId.text))) {
       generalToast(context, AllTexts.uniqueId, AllColors.failedToastColor);
      } else {
        var student = Student(
            name: studentName.text,
            nationalId: int.parse(studentNationalId.text),
             atendNumber: 0);
        getIt<StudentsCubit>()
            .addStudent(student, courseName);
        studentName.text = '';
        studentNationalId.text = '';
        Navigator.pop(context);
      }
    }
  }

  bool chekIfStudentIdExist(int studentNationalId) {
    bool isExist = false;

    List<Map<String, dynamic>> allStudents = getIt<StudentsCubit>().allStudents;
    for (var student in allStudents) {
      if (student['nationalId'] == studentNationalId) {
        isExist = true;

        break;
      }
    }
    return isExist;
  }
}
