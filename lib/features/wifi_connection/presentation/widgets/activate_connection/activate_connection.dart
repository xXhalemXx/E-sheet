import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/activate_connection/all_connected_students.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/general_widgets/connection_header.dart';
import 'package:flutter/material.dart';
class ActivatedConnectionWidget extends StatelessWidget {
  final Map<String,String> connectedStudents;
   ActivatedConnectionWidget({Key? key,required this.connectedStudents}) : super(key: key);


  final String headerText =getIt<ConnectionFunctions>().attendedStudents.length==1?
     AllTexts.onlyOneStudent
      : '${getIt<ConnectionFunctions>().attendedStudents.length} ${AllTexts.attendanceStudents}';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ConnectionHeader(headerText: headerText,textColor: Colors.white,),
        ),
         Expanded(
          flex: 6,
          child: AllConnectedStudents(connectedStudents:connectedStudents),
        )
      ],
    );
  }

}

