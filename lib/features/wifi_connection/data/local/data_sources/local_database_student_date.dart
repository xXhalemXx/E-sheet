import 'package:e_sheet/features/wifi_connection/data/local/models/student_date_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class StudentsDateSource{
   Future<int> addStudent(StudentDateModel student, String courseName);
   Future<List<Map<String, dynamic>>> showStudents(String courseName) ;
   Future<int> deleteStudent(int nationalId,int date, String courseName);
}

class StudentDataSourceImpl extends StudentsDateSource{

  late Database _db;
  Future<Database> openDataBase() async {
    var path = join(await getDatabasesPath(), 'Courses.db');
    _db= await openDatabase(path);
      return _db;
  }

  @override
  Future<int> addStudent(StudentDateModel student, String courseName) async {

    Database db = await openDataBase();
    return await db.insert(courseName, student.tomap());
  }

  @override
  Future<int> deleteStudent(int nationalId,int date, String courseName) async{

    Database db = await openDataBase();
    return  await db.delete(courseName, where: 'nationalId= ? AND date= ?', whereArgs: [nationalId,date]);
  }

  @override
  Future<List<Map<String, dynamic>>> showStudents(String courseName) async {
    Database db = await openDataBase();
    return await db.query(courseName);
  }


 }

