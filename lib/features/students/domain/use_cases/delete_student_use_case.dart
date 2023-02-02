import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';

class DeleteStudent{
  StudentsRepositories studentsRepositories;
  DeleteStudent({required this.studentsRepositories});

  Future<int> call(int nationalId, String courseName) async{
    return await studentsRepositories.deleteStudent(nationalId, courseName);
  }
}