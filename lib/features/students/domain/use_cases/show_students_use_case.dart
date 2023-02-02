import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';

class ShowStudents{

  StudentsRepositories studentsRepositories;
  ShowStudents({required this.studentsRepositories});

  Future<List<Map<String, dynamic>>> call(String courseName) async{
    return await studentsRepositories.showStudents(courseName);
  }
}
