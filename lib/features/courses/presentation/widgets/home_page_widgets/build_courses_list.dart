import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_states.dart';
import 'package:e_sheet/features/courses/presentation/widgets/home_page_widgets/course_style_tail.dart';
import 'package:e_sheet/features/courses/presentation/widgets/home_page_widgets/no_courses_to_show.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/pages/StudentsScreen.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCoursesList extends StatelessWidget{
  const BuildCoursesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesStates>(
      builder: (myContext, currentState) {
        return currentState.when(
            reloadedCourses: (List<String> courses) {
              return courses.isEmpty
                  ? const NoCoursesToShow()
                  : thereCoursesToShow(courses);
            },
            loadCourses: () {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }

  Widget thereCoursesToShow(List<String> courses) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseListTail(
          title: removeUnderscore(courses[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<StudentsCubit>(create: (_) => getIt<StudentsCubit>()),
                    BlocProvider<StudentsDateCubit>(create: (_) => getIt<StudentsDateCubit>()),
                  ],
                  child: StudentScreen(courseName: courses[index]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  String removeUnderscore(String value) {
    List tempCourses = value.split('');
    String tempString = '';
    for (var x in tempCourses) {
      if (x != '_') {
        tempString += x;
      } else {
        tempString += ' ';
      }
    }
    return tempString;
  }


}