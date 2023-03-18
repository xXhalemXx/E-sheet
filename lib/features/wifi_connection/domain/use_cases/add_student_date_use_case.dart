import 'package:e_sheet/features/wifi_connection/domain/entities/student_date_entities.dart';
import 'package:e_sheet/features/wifi_connection/domain/repositories/students_date_repositories.dart';

class AddStudentDate {
  StudentsDataRepositories studentsDataRepositories;

  AddStudentDate({required this.studentsDataRepositories});

  Future<int> call(String courseName, StudentDate student) async {
    return await studentsDataRepositories.addStudentDate(student, courseName);
  }
}
