import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/delete_course_dialog.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget{
  String? dropDownValue;

   DeleteButton({super.key ,required this.dropDownValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          deleteCoursePressed(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text(
          AllTexts.deleteCourse,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  deleteCoursePressed(BuildContext context) {
    if (dropDownValue == '' || dropDownValue == null) {
      generalToast(context, AllTexts.selectFirst, AllColors.failedToastColor);

    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return  DeleteCourseDialog(dropDownValue: dropDownValue,);
        },
      );
    }
  }


}