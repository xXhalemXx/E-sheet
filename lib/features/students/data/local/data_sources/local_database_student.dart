import 'package:e_sheet/features/students/data/local/models/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class StudentsSource{
   Future<int> addStudent(StudentModel student, String courseName);
   Future<List<Map<String, dynamic>>> showStudents(String courseName) ;
   Future<int> deleteStudent(int nationalId, String courseName);
   Future<void> updateStudent(StudentModel student,String courseName) ;
}

class StudentSourceImpl extends StudentsSource{

  late Database _db;
  Future<Database> openDataBase() async {
    var path = join(await getDatabasesPath(), 'Courses.db');
    _db= await openDatabase(path);
      return _db;
  }

  @override
  Future<int> addStudent(StudentModel student, String courseName) async {

    Database db = await openDataBase();
    return await db.insert(courseName, student.tomap());
  }

  @override
  Future<int> deleteStudent(int nationalId, String courseName) async{

    Database db = await openDataBase();
    return  await db.delete(courseName, where: 'nationalId= ?', whereArgs: [nationalId]);
  }

  @override
  Future<List<Map<String, dynamic>>> showStudents(String courseName) async {
    Database db = await openDataBase();
    return await db.query(courseName);
  }

  @override
  Future<void> updateStudent(StudentModel student, String courseName)async {
      Database db = await openDataBase();
      await db.update(courseName,student.tomap(),where: 'nationalId= ?',whereArgs: [student.nationalId] );
  }

 }

