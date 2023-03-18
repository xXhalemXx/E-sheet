import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/student_header.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/list_of_dates.dart';
import 'package:flutter/material.dart';
Widget allStudentsWithDate(BuildContext context,String courseName) {
  return Center(
    child: Column(children: [
      //contain search bar
      const Expanded(
        flex: 1,
        child: StudentHeader(headerText: AllTexts.allLectures,),
      ),
      //contain list of students and bloc builder
      Expanded(
        flex: 8,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: DatesList(courseName: courseName,),
        ),
      ),
      //contain elevated button
    ]),
  );
}