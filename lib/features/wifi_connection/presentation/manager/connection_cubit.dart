import 'package:e_sheet/features/wifi_connection/domain/entities/student_date_entities.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/add_student_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/delete_student_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/show_students_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:bloc/bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';

class ConnectionCubit extends Cubit<ConnectionStates> {
  ConnectionCubit() : super(const ConnectionIdle());

  setupLocalConnection() async {
    if (await Nearby().checkLocationPermission() &&
        await Nearby().checkBluetoothPermission() &&
        await Nearby().checkLocationEnabled()) {
      emit(const ConnectionPermissionGranted());
    } else {
      emit(const ConnectionNoPermission());
    }
  }

  waitingState() {
    emit(const CreateLocalNetwork());
  }

  activateLocalNetwork(Map<String, String> connectedStudents) {
    emit(ConnectionActivate(connectedStudents));
  }

  reloadConnectedStudents(Map<String, String> connectedStudents) {
    emit(const ConnectionIdle());
    emit(ConnectionActivate(connectedStudents));
  }

  modifyAttendedStudents(List<Map<String, dynamic>> attendedStudents) {
    emit(ModifyAttendedStudents(attendedStudents));
  }

  reloadModifiedStudents(List<Map<String, dynamic>> attendedStudents) {
    emit(const ConnectionIdle());
    emit(ModifyAttendedStudents(attendedStudents));
  }
}

class StudentsDateCubit extends Cubit<StudentDateStates> {
  final AddStudentDate addStudentFun;
  final DeleteStudentDate deleteStudentFun;
  final ShowStudentsDate showStudents;

  StudentsDateCubit(
      {required this.showStudents,
      required this.addStudentFun,
      required this.deleteStudentFun})
      : super(const StudentDateInitialState());
  late List<Map<String, dynamic>> allStudents = [];

  emitReloadStudentState(String courseName) {
    showStudents(courseName).then((value) {
      allStudents = value;
      emit(ReloadedStudentsDate(value));
    });
  }

  Future<List<Map<String, dynamic>>> getAllStudents(String courseName) async {
    return await showStudents(courseName);
  }

  addStudent(StudentDate student, String courseName) {
    addStudentFun(courseName, student);
    emitReloadStudentState(courseName);
  }

  deleteStudent(String courseName, int date, int nationalId) {
    deleteStudentFun(nationalId, date, courseName);
    emitReloadStudentState(courseName);
  }
}
