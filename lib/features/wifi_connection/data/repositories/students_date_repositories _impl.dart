import 'package:e_sheet/features/wifi_connection/data/local/data_sources/local_database_student_date.dart';
import 'package:e_sheet/features/wifi_connection/data/local/models/student_date_model.dart';
import 'package:e_sheet/features/wifi_connection/domain/entities/student_date_entities.dart';
import 'package:e_sheet/features/wifi_connection/domain/repositories/students_date_repositories.dart';

class StudentsDataRepositoriesImpl extends StudentsDataRepositories{
 final StudentsDateSource studentsDataSource;
 StudentsDataRepositoriesImpl({required this.studentsDataSource});


  @override
  Future<int> addStudentDate(StudentDate student, String courseName) async {
    final StudentDateModel studentModel=StudentDateModel(date: student.date, nationalId: student.nationalId);
    return  await studentsDataSource.addStudent(studentModel, courseName);
  }

  @override
  Future<int> deleteStudentDate(int nationalId,int date ,String courseName) async {
    return await studentsDataSource.deleteStudent(nationalId,date,courseName);
  }

  @override
  Future<List<Map<String, dynamic>>> showStudentsDate(String courseName) async {
    return await studentsDataSource.showStudents(courseName);
  }


}