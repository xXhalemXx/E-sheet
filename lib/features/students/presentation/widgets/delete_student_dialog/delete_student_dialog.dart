import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/delete_student_dialog/delete_button_dialog.dart';
import 'package:flutter/material.dart';

deleteStudentDialog(BuildContext context,String studentName,String courseName,int studentNationalId){

  showDialog<void>(
  context: context,
  barrierDismissible: false,
  // false = user must tap button, true = tap outside dialog
  builder: (context) {
      return AlertDialog(
        title: const Text(
          AllTexts.warning,
          style: TextStyle(
              color: Colors.red),
        ),
        content: Text(
          '${AllTexts.deleteConfirmation}\n$studentName',
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              AllTexts.no,
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss alert dialog
            },
          ),
          DeleteStudentDialog(studentNationalId: studentNationalId, courseName: courseName, studentName: studentName)
        ],
      );
    },
);

}
