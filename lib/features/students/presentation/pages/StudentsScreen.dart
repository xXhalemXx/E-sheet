
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/add_student_Button.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/list_of_students.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/student_app_bar.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/student_header.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  final String courseName;
  const StudentScreen({required this.courseName, Key? key}) : super(key: key);
  @override
  State<StudentScreen> createState() => StudentScreenStates();
}

class StudentScreenStates extends State<StudentScreen> {


  @override
  void initState() {
    super.initState();
    getIt<StudentsCubit>().emitReloadStudentState(widget.courseName);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return backButtonPressed();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: StudentAppBar(courseName: widget.courseName),
        body: Center(
          child: Column(children: [
            //contain search bar
            const Expanded(
              flex: 1,
              child:StudentHeader(),
            ),
            //contain list of students and bloc builder
            Expanded(
              flex: 7,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: StudentsList(courseName: widget.courseName),
              ),
            ),
            //contain elevated button
            Expanded(flex: 1,child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
            ),)

          ]),
        ),
         floatingActionButton:AddStudentButton(courseName: widget.courseName,),
      ),
    );
  }

   bool backButtonPressed() {
      getIt.resetLazySingleton<StudentsCubit>();
      return true;
  }
}


