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
        final validCharacters = RegExp(r"^[\u0621-\u064A a-zA-z]+$");
        if (value == null || value.isEmpty||value=='') {
          return 'You need to fill this field 😒';
        }
        else if (!validCharacters.hasMatch(value)) {
          return 'you can use alphabet only';
        }
        return null;


      }
    );
  }

}
