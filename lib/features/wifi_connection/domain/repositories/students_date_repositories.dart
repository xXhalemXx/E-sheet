import 'package:e_sheet/features/wifi_connection/domain/entities/student_date_entities.dart';

abstract class StudentsDataRepositories{
  Future<int> addStudentDate(StudentDate student, String courseName);
  Future<List<Map<String, dynamic>>> showStudentsDate(String courseName) ;
  Future<int> deleteStudentDate(int nationalId,int date, String courseName);

}