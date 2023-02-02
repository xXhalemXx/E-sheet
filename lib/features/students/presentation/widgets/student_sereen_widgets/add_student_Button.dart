
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/add_student_dialog/add_student_dialog.dart';
import 'package:flutter/material.dart';

class AddStudentButton extends StatelessWidget{
  final String courseName;
  const AddStudentButton({super.key,required this.courseName});

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02,right:MediaQuery.of(context).size.width*0.02 ),
      child: FloatingActionButton(onPressed: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext x) {
           return AddStudentDialog(courseName: courseName);
            });
      },tooltip: AllTexts.addStudent,child: const Icon(Icons.add),),
    );
  }

}