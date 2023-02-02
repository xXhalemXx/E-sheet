import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/domain/use_cases/add_student_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/delete_student_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/show_students_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/update_student_use_case.dart';
import 'package:e_sheet/features/students/presentation/manager/student_state.dart';
import 'package:bloc/bloc.dart';


class StudentsCubit extends Cubit<StudentStates>{

  final AddStudent addStudentFun;
  final DeleteStudent deleteStudentFun;
  final  UpdateStudent updateStudentFun;
  final  ShowStudents showStudents;


  StudentsCubit({required this.showStudents,required this.addStudentFun,required this.deleteStudentFun,required this.updateStudentFun}):super(const StudentInitialState());
  late List<Map<String,dynamic>> allStudents=[];

  emitReloadStudentState(String courseName){
    showStudents(courseName).then((value) {
      allStudents=value;
      emit(ReloadedStudents(value));
    });
  }

 Future<List<Map<String,dynamic>>> getAllStudents(String courseName)async{
    return await showStudents(courseName);
  }

  addStudent(Student student,String courseName){
    addStudentFun(courseName, student);
    emitReloadStudentState(courseName);
  }
  deleteStudent(String courseName,int nationalId){
    deleteStudentFun(nationalId, courseName);
    emitReloadStudentState(courseName);

  }
  updateStudent(Student student,String courseName){
    updateStudentFun(courseName, student);
    emitReloadStudentState(courseName);
  }


}