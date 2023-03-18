import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/add_student_Button.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/all_students_with_date.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/all_students_with_no_date.dart';
import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/student_app_bar.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  final String courseName;
  bool showWhenSlid = true;

  StudentScreen({required this.courseName, Key? key}) : super(key: key);

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
    getIt<StudentsDateCubit>().emitReloadStudentState('${widget.courseName}WithDate');
    return WillPopScope(
      onWillPop: () async {
        return backButtonPressed();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: StudentAppBar(courseName: widget.courseName,enableSearch: widget.showWhenSlid,),
        body: scrollWidget(),
        floatingActionButton: widget.showWhenSlid
            ? AddStudentButton(
                courseName: widget.courseName,
              )
            : const SizedBox(),
      ),
    );
  }

  bool backButtonPressed() {
    getIt.resetLazySingleton<StudentsCubit>();
    getIt.resetLazySingleton<StudentsDateCubit>();
    return true;
  }

  Widget scrollWidget() {
    final PageController controller = PageController();
    return PageView(
      onPageChanged: whenSlide,
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[allStudentsNoDate(context,widget.courseName), allStudentsWithDate(context,widget.courseName)],
    );
  }

  void whenSlide(int? x) {
    setState(() {
      widget.showWhenSlid?widget.showWhenSlid=false:widget.showWhenSlid=true;
    });
  }
}
