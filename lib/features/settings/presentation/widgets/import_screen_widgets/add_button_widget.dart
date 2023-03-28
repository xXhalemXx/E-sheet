import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final TextEditingController courseEnteredName;
  final GlobalKey<FormState> formKey;
  final List<Map<String, dynamic>> allStudents;

  const AddButton(
      {super.key,
      required this.courseEnteredName,
      required this.formKey,
      required this.allStudents});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
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
          AllTexts.addToCoursesAndFill,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void addCoursePressed(BuildContext context) {
    try {
      if (formKey.currentState!.validate()) {
        if (checkIfCourseExist(courseEnteredName.text)) {
          generalToast(
              context, AllTexts.courseExist, AllColors.failedToastColor);
        } else {
          getIt<CoursesCubit>().addNewCourse(
              replaceWhiteSpaceByUnderscore(courseEnteredName.text));
          FocusScopeNode currentFoucs = FocusScope.of(context);
          currentFoucs.unfocus();
          generalToast(context, AllTexts.courseAddedSuccessfully,
              AllColors.successToastColor);
          addAllStudents(context,replaceWhiteSpaceByUnderscore(courseEnteredName.text));
          courseEnteredName.text = '';
        }
      }
    } catch (e) {
      generalToast(context, e.toString(), AllColors.failedToastColor, 3);
    }
  }

  addAllStudents(BuildContext context, String courseName) {
    var noRepeatedValList =allStudents.toSet().toList();
    for(var value in noRepeatedValList) {
      var student = Student(
          name: value['name'], nationalId: value['studentNum'], atendNumber: 0);
      getIt<StudentsCubit>().addStudent(student, courseName);
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
