//modifier

import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/student_global_variables.dart';
import 'package:flutter/material.dart';



class AttendNumberModifier extends StatefulWidget{

  final int studentAtendNum;

  const AttendNumberModifier({super.key,required this.studentAtendNum});

  @override
  State<AttendNumberModifier> createState() => _AttendNumberModifierState();
}

class _AttendNumberModifierState extends State<AttendNumberModifier> {

  @override
  void initState() {
   GlobalVariables.newStudentAttendNumber =widget.studentAtendNum;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (_, setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: RawMaterialButton(
              onPressed: () {
                setState(() {
                  GlobalVariables.newStudentAttendNumber += 1;
                });
                // MyCubit.get(context).rebuildStudentFun();
              },
              elevation: 2,
              fillColor: Colors.blue,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "${GlobalVariables.newStudentAttendNumber}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
            child: RawMaterialButton(
              onPressed: () {
                setState(() {
                  if (GlobalVariables.newStudentAttendNumber > 0) {
                    GlobalVariables.newStudentAttendNumber -= 1;
                  } else {
                   generalToast(context, AllTexts.youCantDecreaseIt, AllColors.failedToastColor);
                  }
                });
                },
              elevation: 2,
              fillColor: Colors.blue,
              shape: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Icon(
                  Icons.minimize_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}