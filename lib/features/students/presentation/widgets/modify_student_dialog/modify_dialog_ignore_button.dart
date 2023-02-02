import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/student_global_variables.dart';
import 'package:flutter/material.dart';

class IgnoreModifyButton extends StatelessWidget{
  const IgnoreModifyButton({super.key});


  @override
  Widget build(BuildContext context) {
      return TextButton(
        onPressed: () {
         GlobalVariables.newStudentName.text = '';
          Navigator.pop(context);
        },
        child: const Text(
          AllTexts.ignore,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      );
  }

}

