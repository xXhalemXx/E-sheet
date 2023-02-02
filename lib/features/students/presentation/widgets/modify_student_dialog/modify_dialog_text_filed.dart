import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/student_global_variables.dart';
import 'package:flutter/material.dart';

class ModifyTextFiled extends StatelessWidget{
  final String studentName;
  const ModifyTextFiled({super.key,required this.studentName});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: GlobalVariables.newStudentName,
      decoration: InputDecoration(
        labelText: AllTexts.enterStudentName,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
      validator: (value) {
        if (value == '' || value == null) {
          GlobalVariables.newStudentName.text = studentName;
          return null;
        }
        if (value.contains('.') ||
            value.contains('/') ||
            value.contains('\\') ||
            value.contains('}') ||
            value.contains('{') ||
            value.contains('@') ||
            value.contains('#') ||
            value.contains('!') ||
            value.contains('\$') ||
            value.contains('%') ||
            value.contains('^') ||
            value.contains('&') ||
            value.contains('*') ||
            value.contains('(') ||
            value.contains(')') ||
            value.contains('_') ||
            value.contains('+')) {
          return AllTexts.noSpecialCharacters;
        }

        return null;
      },
    );
  }

}
