import 'package:flutter/material.dart';

class UpdateNameFiled extends StatelessWidget{
  final TextEditingController newDoctorName;
  const UpdateNameFiled({super.key,required this.newDoctorName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        child: TextFormField(
          controller: newDoctorName,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            labelText: 'Enter new name',
          ),
          validator: (value) {
            return courseNameValidate(value);
          },
        ),
      );
    }

  String? courseNameValidate(String? value) {

    if (value == null || value.isEmpty||value=='') {
      return 'You need to fill this field 😒';
    }
    else if (value.contains('.') ||
        value.contains('/') ||
        value.contains('\\')||
        value.contains('}') ||
        value.contains('{') ||
        value.contains('@') ||
        value.contains('#') ||
        value.contains('!') ||
        value.contains('\$')||
        value.contains('%') ||
        value.contains('^') ||
        value.contains('&') ||
        value.contains('*') ||
        value.contains('(') ||
        value.contains(')')||
        value.contains('_') ||
        value.contains(',') ||
        value.contains('?') ||
        value.contains('+')) {
      return 'you cant use any special character\nlike # % ^ { } ( ) @ ! .';
    }
    return null;


  }

}
