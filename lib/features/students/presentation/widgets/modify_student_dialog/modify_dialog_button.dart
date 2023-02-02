import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/student_global_variables.dart';
import 'package:flutter/material.dart';

class ModifyDialogButton extends StatelessWidget {
  final String studentName;
  final int studentNationalId;
  final String courseName;
  final GlobalKey<FormState> formKey;

  const ModifyDialogButton(
      {super.key,
      required this.studentName,
      required this.courseName,
      required this.studentNationalId,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        updateStudentDataPressed(context);
      },
      child: const Text(
       AllTexts.update ,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }

  updateStudentDataPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {

      Student tempStudent = Student(
          name: GlobalVariables.newStudentName.text,
          nationalId: studentNationalId,
          atendNumber: GlobalVariables.newStudentAttendNumber);

      getIt<StudentsCubit>().updateStudent(tempStudent, courseName);

      Navigator.pop(context);

      GlobalVariables.newStudentName.text='';
    }
  }
}
