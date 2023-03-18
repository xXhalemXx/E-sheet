import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';

class StudentsAttendedList extends StatefulWidget {
  final String courseName;
  final List<int> allStudentsNum;

  const StudentsAttendedList(
      {super.key, required this.courseName, required this.allStudentsNum});

  @override
  State<StudentsAttendedList> createState() => _StudentsAttendedListState();
}

class _StudentsAttendedListState extends State<StudentsAttendedList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getStudentsName(widget.courseName, widget.allStudentsNum),
        builder: (_, asyncSnapshot) {
      if (asyncSnapshot.hasData){
        return thereStudentsToShow(asyncSnapshot.data, widget.courseName);
      }else{
        return const Center(child:  CircularProgressIndicator());
      }
    });
  }

  ListView thereStudentsToShow(
      List<String>? students, String courseName) {
    return ListView.builder(
        itemCount: students!.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: studentsTail(students[index]),
          );
        });
  }
}

Widget studentsTail(String studentName){
  return Padding(
    padding: const EdgeInsets.only(top: 6),
    child: ListTile(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      tileColor: Colors.grey.shade200,
      title: Center(
        child: AutoSizeText(
          studentName,
          maxLines: 1,
        ),
      ),
    ),
  );
}

Future<List<String>> getStudentsName(
    String courseName, List<int> allStudentsNum) async {
  var allStudents = await getIt<StudentsCubit>().getAllStudents(courseName);
  List<String> attendedStudents = [];
  for (var student in allStudents) {
    if (allStudentsNum.contains(student['nationalId'])) {
      attendedStudents.add(student['name']);
    }
  }

  return attendedStudents;
}
