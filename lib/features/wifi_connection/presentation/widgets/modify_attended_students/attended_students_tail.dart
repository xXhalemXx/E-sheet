import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/delete_student_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AttendedStudentsTail extends StatelessWidget {
  const AttendedStudentsTail({super.key,required this.student,required this.color});
  final Map<String,dynamic> student;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        tileColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: AutoSizeText(
          "name: ${student['name']}",
          maxLines: 1,
        ),
        trailing: IconButton(
          onPressed: () {
            deleteStudentDialog(context,student);
          },
          icon: const Icon(Icons.delete),
          splashColor: Colors.red,
          splashRadius: 25,
        ),
      ),
    );
  }
}
