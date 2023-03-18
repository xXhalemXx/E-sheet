import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/add_student_dialog/add_student_dialog_button.dart';
import 'package:e_sheet/features/students/presentation/widgets/add_student_dialog/ignore_dialog_button.dart';
import 'package:flutter/material.dart';

class AddStudentDialog extends StatelessWidget {
  final String courseName;
  AddStudentDialog({super.key,required this.courseName});

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final TextEditingController studentName = TextEditingController();
 final TextEditingController studentNationalId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      scrollable: true,
      title: const Text(AllTexts.addStudent),
      content: SizedBox(
        width: 300,
        child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: studentName,
                    decoration: InputDecoration(
                      labelText: AllTexts.enterStudentName,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    validator: (value) {
                      return studentNameValidate(value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: studentNationalId,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AllTexts.enterStudentId,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    validator: (value) {
                      return nationalIdValidate(value);
                    },
                  )
                ],
              ),
            )),
      ),
      actions: [
        IgnoreAddButton(studentNationalId: studentNationalId, studentName: studentName),
        AddStudentDialogButton(formKey: formKey, studentName: studentName, studentNationalId: studentNationalId, courseName: courseName),

      ],
    );
  }

  String? studentNameValidate(String? value) {
    final validCharacters = RegExp(r"^[\u0621-\u064A a-zA-z]+$");
    if (value == null || value.isEmpty) {
      return AllTexts.youNeedToFillThis ;
    } else if (!validCharacters.hasMatch(value)) {
      return AllTexts.noSpecialCharacters ;
    }
    return null;
  }
//todo change 14 to new value
  String? nationalIdValidate(String? value) {
    final validCharacters = RegExp(r"^\d+$");
    if (value == null || value.isEmpty) {
      return AllTexts.youNeedToFillThis;
    } else if (!validCharacters.hasMatch(value)) {
      return AllTexts.noSpecialCharacters;
    }
    return null;
  }
}
