import 'package:e_sheet/features/wifi_connection/domain/entities/student_date_entities.dart';

class StudentDateModel extends StudentDate{
  StudentDateModel({required super.date, required super.nationalId});

  Map<String, dynamic> tomap() {
    return {
      'nationalId': nationalId,
      'date': date,
    };
  }
}