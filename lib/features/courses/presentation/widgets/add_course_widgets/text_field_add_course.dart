import 'package:e_sheet/core/general_use/constant.dart';
import 'package:flutter/material.dart';

class CourseNameFiled extends StatelessWidget{
  final TextEditingController courseEnteredName;
  const CourseNameFiled({super.key,required this.courseEnteredName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        child: TextFormField(
          controller: courseEnteredName,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            labelText: AllTexts.enterCourseName,
          ),
          validator: (value) {
            return courseNameValidate(value);
          },
        ),
      );
    }

  String? courseNameValidate(String? value) {
    final validCharacters = RegExp(r"^[\u0621-\u064A a-zA-z]+$");
    if (value == null || value.isEmpty||value=='') {
      return 'You need to fill this field 😒';
    }
    else if (!validCharacters.hasMatch(value)) {
      return 'you can use alphabet only';
    }
    return null;


  }

}
