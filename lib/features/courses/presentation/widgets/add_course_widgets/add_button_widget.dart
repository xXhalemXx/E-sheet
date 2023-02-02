import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  final TextEditingController courseEnteredName;
  final GlobalKey<FormState> formKey;
  const AddButton(
      {super.key,
      required this.courseEnteredName,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          addCoursePressed(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: const Text(
          AllTexts.addToCourses,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void addCoursePressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (checkIfCourseExist(courseEnteredName.text)) {
       generalToast(context, AllTexts.courseExist, AllColors.failedToastColor);
      } else {
        getIt<CoursesCubit>().addNewCourse(
            replaceWhiteSpaceByUnderscore(courseEnteredName.text));
        FocusScopeNode currentFoucs = FocusScope.of(context);
        currentFoucs.unfocus();
      generalToast(context, AllTexts.courseAddedSuccessfully, AllColors.successToastColor);
        courseEnteredName.text = '';
      }
    }
  }

  bool checkIfCourseExist(String courseName) {
    bool result = false;
    List demoList = getIt<CoursesCubit>().courses;
    courseName = courseName.trim();

    for (var x in demoList) {
      if (x == replaceWhiteSpaceByUnderscore(courseName)) {
        result = true;
      }
    }
    return result;
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
}
