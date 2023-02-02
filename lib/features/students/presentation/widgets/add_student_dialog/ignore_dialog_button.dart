import 'package:e_sheet/core/general_use/constant.dart';
import 'package:flutter/material.dart';

class IgnoreAddButton extends StatelessWidget{
  final TextEditingController studentName ;
  final TextEditingController studentNationalId ;
  const IgnoreAddButton({super.key,required this.studentNationalId,required this.studentName});


  @override
  Widget build(BuildContext context) {
      return TextButton(
        onPressed: () {
          studentName.text = '';
          studentNationalId.text = '';
          Navigator.pop(context);
        },
        child: const Text(
          AllTexts.ignore,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      );
  }


}