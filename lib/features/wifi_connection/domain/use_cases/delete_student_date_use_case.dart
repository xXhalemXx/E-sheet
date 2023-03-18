
import 'package:e_sheet/features/wifi_connection/domain/repositories/students_date_repositories.dart';

class DeleteStudentDate{
  StudentsDataRepositories studentsDateRepositories;
  DeleteStudentDate({required this.studentsDateRepositories});

  Future<int> call(int nationalId,int date, String courseName) async{
    return await studentsDateRepositories.deleteStudentDate(nationalId,date, courseName);
  }
}