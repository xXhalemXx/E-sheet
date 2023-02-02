import 'package:e_sheet/features/wifi_connection/presentation/widgets/general_widgets/connection_header.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/attended_students.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/search_in_modify_widget.dart';
import 'package:flutter/material.dart';

class ModifyAttendedStudentsWidget extends StatelessWidget {
  const ModifyAttendedStudentsWidget(
      {super.key, required this.attendedStudents});

  final List<Map<String, dynamic>> attendedStudents;

  final String headerText = 'Modify attended students';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ConnectionHeader(headerText: headerText, textColor: Colors.white),
              const SearchInModify()
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: attendedStudents.isEmpty
              ?  noAttendedStudent(context)
              : AttendedStudents(
            attendedStudents: attendedStudents, color: Colors.white24,
          ),
        )
      ],
    );
  }
 Widget noAttendedStudent(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
      child: const Center(
        child: Text(
          "No attended students",
          style: TextStyle(color: Colors.blueGrey),
          maxLines: 1,
        ),
      ),
    );
  }

}
