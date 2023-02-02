import 'package:e_sheet/features/courses/domain/use_cases/show_courses.dart';
import 'package:e_sheet/features/courses/domain/use_cases/delete_course.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_states.dart';
import 'package:e_sheet/features/courses/domain/use_cases/add_course.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesStates>{
   final ShowCourses showCourses;
   final AddCourse addCourse;
   final DeleteCourse deleteCourse;


  CoursesCubit({required this.showCourses,required this.addCourse,required this.deleteCourse}):super(const LoadCourses());
  late List<String> courses;

  emitReloadState(){
    showCourses().then((value){
      courses=value;
      emit(ReloadedCourses(value));
    } );

  }
  Future<bool> addNewCourse(String courseName) async{
    bool result = await addCourse(courseName);
    showCourses().then((value){
      courses=value;
    } );
    return result;
  }
  Future<bool> removeCourse(String courseName) async{
    bool result = await  deleteCourse(courseName);
    showCourses().then((value){
      courses=value;
    } );
    return result;
  }

}
