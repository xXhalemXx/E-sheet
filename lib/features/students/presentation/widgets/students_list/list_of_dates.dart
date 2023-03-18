import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/manager/student_state.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/date_style_tail.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/student_style_tail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatesList extends StatelessWidget {
  final String courseName;
  const DatesList({super.key,required this.courseName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsDateCubit, StudentDateStates>(
      builder: (_, currentState) {
        return currentState.when(studentDateInitialState: () {
          return const Center(child: CircularProgressIndicator());
        }, reloadedStudentsDate: (List<Map<String, dynamic>> studentsDate) {
          List<int> allDates=getDifferentDates(studentsDate);
          return studentsDate.isEmpty
              ? noLectures(context)
              : thereLecturesToShow(studentsDate,allDates, courseName);
        });
      },
    );
  }

  Center noLectures(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Image.asset('assets/pics/no_student.png'),
            const SizedBox(height: 10,),
            const AutoSizeText(
              AllTexts.noLecturesYet,
              maxLines: 1,
              style: TextStyle(color: Color(0xff7CB7FF), fontSize: 50,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  ListView thereLecturesToShow(
      List<Map<String, dynamic>> studentsDate,List<int> allDates ,String courseName) {
    return ListView.builder(
        itemCount: allDates.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: DateListTail(courseName: courseName, studentsDate:studentsDate, date: allDates[index],),
          );
        });
  }
}

List<int> getDifferentDates(List<Map<String, dynamic>> studentsDate) {
  List<int> allDates=[];
  for(var student in studentsDate){
    if(!allDates.contains(student['date'])){
      allDates.add(student['date']);
    }
  }
  return allDates;
}
