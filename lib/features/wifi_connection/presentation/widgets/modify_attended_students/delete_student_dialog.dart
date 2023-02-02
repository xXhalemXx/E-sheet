import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/delete_button_dialog.dart';
import 'package:flutter/material.dart';

deleteStudentDialog(BuildContext context,Map<String,dynamic> student){

  showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (context) {
      return AlertDialog(
        title: const Text(
          AllTexts.warning,
          style: TextStyle(
              color: Colors.red),
        ),
        content: Text(
          '${AllTexts.deleteConfirmation}\n${student['name']}',
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
          DeleteStudentDialog(student: student,)
        ],
      );
    },
);

}
