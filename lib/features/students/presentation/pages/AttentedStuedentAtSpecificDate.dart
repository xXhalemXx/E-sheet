import 'package:e_sheet/features/students/presentation/widgets/attended_student_at_specific_date_widgets/body_of_attended_students.dart';
import 'package:e_sheet/features/students/presentation/widgets/attended_student_at_specific_date_widgets/search_in_lecture.dart';
import 'package:flutter/material.dart';

class StudentAttendedATThisDate extends StatefulWidget {
  const StudentAttendedATThisDate(
      {Key? key,
      required this.courseName,
      required this.date,
      required this.studentsDate})
      : super(key: key);
  final int date;
  final List<Map<String, dynamic>> studentsDate;
  final String courseName;

  @override
  State<StudentAttendedATThisDate> createState() =>
      _StudentAttendedATThisDateState();
}

class _StudentAttendedATThisDateState extends State<StudentAttendedATThisDate> {
  @override
  Widget build(BuildContext context) {
    List<int> allStudentsNum = getAllStudents(widget.date, widget.studentsDate);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(convertToDate(widget.date)),
        actions: [ IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                  NewSearchInLecDelegate(courseName: widget.courseName,allStudentsNum: allStudentsNum));
            },
            icon: const Icon(Icons.search)),],
      ),
      body: attendedStudentInSpecificDate(
          context, widget.courseName, allStudentsNum),
    );
  }
}

List<int> getAllStudents(
    final int date, List<Map<String, dynamic>> studentsDate) {
  List<int> allStudentsNum = [];
  for (var student in studentsDate) {
    if (student['date'] == date) {
      allStudentsNum.add(student['nationalId']);
    }
  }
  return allStudentsNum;
}
String convertToDate(int date) {
  DateTime convertedDate=DateTime.fromMillisecondsSinceEpoch(date);
  String sDate ='$convertedDate';
  String result='';
  for(var char in sDate.split(''))
    {
      if(char ==' '){
        break;
      }
      else{
        result+=char;
      }
    }
  return result;
}
