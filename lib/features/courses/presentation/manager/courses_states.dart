
import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses_states.freezed.dart';

@freezed
class CoursesStates with _$CoursesStates {

  const factory CoursesStates.loadCourses()= LoadCourses;

  const factory CoursesStates.reloadedCourses(List<String> courses)= ReloadedCourses;
}