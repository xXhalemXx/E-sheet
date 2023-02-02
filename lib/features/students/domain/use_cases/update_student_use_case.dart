import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';

class UpdateStudent{
  StudentsRepositories studentsRepositories;
  UpdateStudent({required this.studentsRepositories});

  Future<void> call(String courseName,Student student) async{
    return await studentsRepositories.updateStudent(student, courseName);
  }
}