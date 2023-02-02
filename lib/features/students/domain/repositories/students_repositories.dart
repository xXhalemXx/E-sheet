import 'package:e_sheet/features/students/domain/entities/student_entities.dart';

abstract class StudentsRepositories{
  Future<int> addStudent(Student student, String courseName);
  Future<List<Map<String, dynamic>>> showStudents(String courseName) ;
  Future<int> deleteStudent(int nationalId, String courseName);
  Future<void> updateStudent(Student student,String courseName) ;

}