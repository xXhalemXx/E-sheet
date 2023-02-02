import 'package:e_sheet/features/students/domain/entities/student_entities.dart';

class StudentModel extends Student{
  StudentModel({required super.name, required super.atendNumber, required super.nationalId});

  Map<String, dynamic> tomap() {
    return {
      'nationalId': nationalId,
      'name': name,
      'atendNumber': atendNumber,
    };
  }
}