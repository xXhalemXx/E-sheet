import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/widgets/modify_student_dialog/student_global_variables.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StudentHeader extends StatefulWidget {
  const StudentHeader({super.key});

  @override
  State<StudentHeader> createState() => _StudentHeaderState();
}

class _StudentHeaderState extends State<StudentHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      child: headerText(),
    );
  }

  Center headerText() {
    return const Center(
      child: AutoSizeText(
        AllTexts.rolledStudents,
        maxLines: 1,
        style: TextStyle(
            fontFamily: 'RubikDistressed', color: Colors.blue, fontSize: 30),
      ),
    );
  }

}
