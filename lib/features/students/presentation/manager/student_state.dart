import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_state.freezed.dart';

@freezed
class StudentStates with _$StudentStates {
  const factory StudentStates.studentInitialState()= StudentInitialState;
  const factory StudentStates.reloadedStudents(List<Map<String,dynamic>> students)= ReloadedStudents;
}