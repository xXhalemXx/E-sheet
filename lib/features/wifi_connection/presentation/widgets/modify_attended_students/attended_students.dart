import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/attended_students_tail.dart';
import 'package:flutter/material.dart';

class AttendedStudents extends StatelessWidget {
  const AttendedStudents(
      {super.key, required this.attendedStudents, required this.color});

  final Color color;
  final List<Map<String, dynamic>> attendedStudents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: allAttendedStudents(),
      ),
    );
  }

  ListView allAttendedStudents() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: attendedStudents.length,
        itemBuilder: (_, index) {
          return  AttendedStudentsTail(
                  student: attendedStudents[index],
                  color: color,
                );
        });
  }
}
