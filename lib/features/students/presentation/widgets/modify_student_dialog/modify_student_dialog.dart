import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/modify_dialog_button.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/modify_dialog_ignore_button.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/modify_dialog_text_filed.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

modifyStudentDialog(BuildContext context, String studentName,
    int studentAtendNum, String courseName, int studentNationalId) {
  var formKey = GlobalKey<FormState>();
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          scrollable: true,
          title: const Text(AllTexts.modifyStudent),
          content: Column(
            children: [
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      ModifyTextFiled(studentName: studentName),
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText('Student Number:$studentNationalId',maxLines: 1,),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            const IgnoreModifyButton(),
            ModifyDialogButton(
              studentName: studentName,
              courseName: courseName,
              studentNationalId: studentNationalId,
              formKey: formKey,
            ),
          ],
        );
      });
}
