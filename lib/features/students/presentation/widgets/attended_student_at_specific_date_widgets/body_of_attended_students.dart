import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/attended_student_at_specific_date_widgets/list_of_students.dart';
import 'package:flutter/material.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/student_header.dart';

Widget attendedStudentInSpecificDate(
    BuildContext context, String courseName, List<int> allStudentsNum) {

  return Center(
    child: Column(children: [
      //contain search bar
      const Expanded(
        flex: 1,
        child: StudentHeader(
          headerText: AllTexts.attendanceStudents,
        ),
      ),
      //contain list of students and bloc builder
      Expanded(
        flex: 8,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: StudentsAttendedList(courseName: courseName,allStudentsNum: allStudentsNum,),
        ),
      ),
      //contain elevated button
    ]),
  );
}
