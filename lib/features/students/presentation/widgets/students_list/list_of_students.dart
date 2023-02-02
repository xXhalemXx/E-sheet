import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/manager/student_state.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/student_style_tail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsList extends StatelessWidget {
  final String courseName;
  const StudentsList({super.key,required this.courseName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCubit, StudentStates>(
      builder: (_, currentState) {
        return currentState.when(studentInitialState: () {
          return const Center(child: CircularProgressIndicator());
        }, reloadedStudents: (List<Map<String, dynamic>> students) {
          return students.isEmpty
              ? noStudents(context)
              : thereStudentsToShow(students, courseName);
        });
      },
    );
  }

  Center noStudents(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Image.asset('assets/pics/no_student.png'),
            const SizedBox(height: 10,),
            const AutoSizeText(
              AllTexts.noStudentsToShow,
              maxLines: 1,
              style: TextStyle(color: Color(0xff7CB7FF), fontSize: 50,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  ListView thereStudentsToShow(
      List<Map<String, dynamic>> students, String courseName) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: StudentListTail(
              studentName: students[index]['name'],
              studentAtendNum: students[index]['atendNumber'],
              studentNationalId: students[index]['nationalId'],
              courseName: courseName,
            ),
          );
        });
  }
}
