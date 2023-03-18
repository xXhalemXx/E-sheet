import 'package:e_sheet/features/wifi_connection/domain/repositories/students_date_repositories.dart';

class ShowStudentsDate {
  StudentsDataRepositories studentsDataRepositories;

  ShowStudentsDate({required this.studentsDataRepositories});

  Future<List<Map<String, dynamic>>> call(String courseName) async {
    return await studentsDataRepositories.showStudentsDate(courseName);
  }
}
