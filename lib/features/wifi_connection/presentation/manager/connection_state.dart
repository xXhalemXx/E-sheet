
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

@freezed
class ConnectionStates with _$ConnectionStates {

  const factory ConnectionStates.connectionIdle()= ConnectionIdle;

  const factory ConnectionStates.connectionNoPermission()= ConnectionNoPermission;
  const factory ConnectionStates.createLocalNetwork()= CreateLocalNetwork;
  const factory ConnectionStates.connectionPermissionGranted()= ConnectionPermissionGranted;
  const factory ConnectionStates.connectionActivate(Map<String,String> connectedStudents)= ConnectionActivate;
  const factory ConnectionStates.modifyAttendedStudents(List<Map<String,dynamic>> attendedStudents)= ModifyAttendedStudents;

}

@freezed
class StudentDateStates with _$StudentDateStates {
  const factory StudentDateStates.studentDateInitialState()= StudentDateInitialState;
  const factory StudentDateStates.reloadedStudentsDate(List<Map<String,dynamic>> studentsDate)= ReloadedStudentsDate;
}