import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/modify_selected_exel_widgets.dart';
import 'package:flutter/material.dart';

class ModifySelectedFile extends StatefulWidget {
  final List<Map<String, dynamic>> allStudents;

  const ModifySelectedFile({Key? key, required this.allStudents})
      : super(key: key);

  @override
  State<ModifySelectedFile> createState() => _ModifySelectedFileState();
}

class _ModifySelectedFileState extends State<ModifySelectedFile> {
  bool swap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: tableHeader()),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: tableDecoration(),
                    child: Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.76,
                          child: listOfData(widget.allStudents, swap)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: screenButtons(context, () {
        swapButtonPressed();
      },widget.allStudents,swap),
    );
  }

  void swapButtonPressed() {
    setState(() {
      swap ? swap = false : swap = true;
    });
  }
}


