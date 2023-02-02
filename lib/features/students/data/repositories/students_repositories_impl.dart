import 'package:e_sheet/features/students/data/local/data_sources/local_database_student.dart';
import 'package:e_sheet/features/students/data/local/models/student_model.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';

class StudentsRepositoriesImpl extends StudentsRepositories{
 final StudentsSource studentsSource;
 StudentsRepositoriesImpl({required this.studentsSource});


  @override
  Future<int> addStudent(Student student, String courseName) async {
    final StudentModel studentModel=StudentModel(name: student.name, nationalId: student.nationalId,atendNumber: student.atendNumber);
    return  await studentsSource.addStudent(studentModel, courseName);
  }

  @override
  Future<int> deleteStudent(int nationalId, String courseName) async {
    return await studentsSource.deleteStudent(nationalId, courseName);
  }

  @override
  Future<List<Map<String, dynamic>>> showStudents(String courseName) async {
    return await studentsSource.showStudents(courseName);
  }

  @override
  Future<void> updateStudent(Student student, String courseName) async {
    final StudentModel studentModel=StudentModel(name: student.name, nationalId: student.nationalId, atendNumber: student.atendNumber);
    return  await studentsSource.updateStudent(studentModel, courseName);
  }

}