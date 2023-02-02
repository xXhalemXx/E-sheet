import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';

class AddStudent{
  StudentsRepositories studentsRepositories;
  AddStudent({required this.studentsRepositories});

  Future<int> call(String courseName,Student student) async{
    return await studentsRepositories.addStudent(student, courseName);
  }
}