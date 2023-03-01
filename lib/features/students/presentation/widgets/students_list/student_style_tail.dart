import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/delete_student_dialog/delete_student_dialog.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/modify_student_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StudentListTail extends StatefulWidget {
  final String studentName;
  final int studentAtendNum;
  final int studentNationalId;
  final String courseName;

  const StudentListTail({
    Key? key,
    required this.studentNationalId,
    required this.courseName,
    required this.studentName,
    required this.studentAtendNum,
  }) : super(key: key);

  @override
  State<StudentListTail> createState() => _StudentListTailState();
}

class _StudentListTailState extends State<StudentListTail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        modifyStudentDialog(
            context,
            widget.studentName,
            widget.studentAtendNum,
            widget.courseName,
            widget.studentNationalId);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          tileColor: Colors.grey.shade200,
          title: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AutoSizeText(
              widget.studentName,
              maxLines: 1,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              Text("${AllTexts.attendanceTimes}: ${widget.studentAtendNum}"),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              deleteStudentDialog(context, widget.studentName,
                  widget.courseName, widget.studentNationalId);
            },
            icon: const Icon(Icons.delete,),
            splashColor: Colors.red,
            splashRadius: 25,
          ),
        ),
      ),
    );
  }
}
