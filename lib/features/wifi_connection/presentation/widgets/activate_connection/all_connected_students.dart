import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/activate_connection/connected_students_tail.dart';
import 'package:flutter/material.dart';

class AllConnectedStudents extends StatelessWidget {
  final Map<String, String> connectedStudents;

  const AllConnectedStudents({Key? key, required this.connectedStudents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: connectedStudents.isNotEmpty
                  ? allConnectedStudents()
                  : noConnectedStudents(context)),
          //stopButton(),
        ],
      ),
    );
  }

  ListView allConnectedStudents() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: connectedStudents.length,
        itemBuilder: (_, index) {
          return ConnectedStudentsTail(
            studentId: connectedStudents.keys.toList()[index],
            studentName: connectedStudents.values.toList()[index],
          );
        });
  }

  Center noConnectedStudents(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset('assets/pics/no_conneceted_students.png')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                AllTexts.noOneConnected,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
