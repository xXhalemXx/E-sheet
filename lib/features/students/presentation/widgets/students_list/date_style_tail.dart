import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_sheet/features/students/presentation/pages/AttentedStuedentAtSpecificDate.dart';
import 'package:flutter/material.dart';

class DateListTail extends StatefulWidget {
  final int date;
  final List<Map<String, dynamic>> studentsDate;
  final String courseName;

  const DateListTail(
      {Key? key,
      required this.courseName,
      required this.date,
      required this.studentsDate})
      : super(key: key);

  @override
  State<DateListTail> createState() => _DateListTailState();
}

class _DateListTailState extends State<DateListTail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StudentAttendedATThisDate(courseName: widget.courseName, studentsDate: widget.studentsDate, date: widget.date,),
          ),
        );

      },
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          tileColor: Colors.grey.shade200,
          title: Center(
            child: AutoSizeText(
              convertToDate(widget.date),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
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

}
