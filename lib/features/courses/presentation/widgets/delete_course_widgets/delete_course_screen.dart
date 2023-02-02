import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_states.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/list_of_courses_to_delete.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/no_courses_to_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DeleteCourseScreen extends StatelessWidget {
    DeleteCourseScreen({Key? key}) : super(key: key);
   String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    getIt<CoursesCubit>().emitReloadState();
    return Container(
      decoration: backGroundColor(),
      child: Center(
        child:
            allCourses(context),
      ),
    );
  }

  Widget allCourses(BuildContext context) {
    return Center(child: BlocBuilder<CoursesCubit, CoursesStates>(
      builder: (_, currentState) {
        return currentState.when(
            loadCourses: () {
              return const Center(child: CircularProgressIndicator(color: Colors.cyanAccent,));
            }, reloadedCourses: (courses) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: courses.isEmpty
                ? const NoCoursesToDelete()
                : ListOfCoursesWithButton(courses: courses, dropDownValue: dropDownValue,),
          );
        });
      },
    ));
  }


  BoxDecoration backGroundColor() {
    return  BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.blueAccent.shade400,
          Colors.blueAccent,
          Colors.white54,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }




}

