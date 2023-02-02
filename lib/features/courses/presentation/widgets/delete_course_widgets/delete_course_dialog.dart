import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/delete_course_screen.dart';
import 'package:flutter/material.dart';

class DeleteCourseDialog extends StatelessWidget{
     String? dropDownValue;

   DeleteCourseDialog({super.key,required this.dropDownValue});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
       AllTexts.warning,
        style: TextStyle(
            color: AllColors.warningColor, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      content: Text(
        '${AllTexts.deleteConfirmation}\n$dropDownValue',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
        TextButton(
          child: const Text(
            AllTexts.yes,
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {
            deleteCoursePressedYes(context);
          },
        ),
      ],
    );
  }
  deleteCoursePressedYes(BuildContext context) {
    getIt<CoursesCubit>().deleteCourse(replaceWhiteSpaceByUnderscore(dropDownValue!));

    getIt<CoursesCubit>().emitReloadState();

    Navigator.of(context).pop();

   generalToast(context, AllTexts.courseDeletedSuccessfully, AllColors.successToastColor);

    dropDownValue = null;

  }

  String replaceWhiteSpaceByUnderscore(String courseName) {
    courseName = courseName.trim();
    List tempCourse = courseName.split('');
    courseName = '';
    for (var x in tempCourse) {
      if (x != ' ') {
        courseName += x;
      } else {
        courseName += '_';
      }
    }
    return courseName;
  }

  String removeUnderscore(String value) {
    List tempCourses = value.split('');
    String tempString = '';
    for (var x in tempCourses) {
      if (x != '_') {
        tempString += x;
      } else {
        tempString += ' ';
      }
    }
    return tempString;
  }


}