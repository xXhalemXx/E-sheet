import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class CoursesSource {
  Future<List<String>> showCourses();

  Future<void> addCourse(String courseName);

  Future<void> deleteCourse(String courseName);
}

class CoursesSourceImpl implements CoursesSource {
  Database? db;

  factory CoursesSourceImpl() => CoursesSourceImpl.internal();

  CoursesSourceImpl.internal();

  Future<Database> createDataBase() async {
    if (db == null) {
      var path1 = join(await getDatabasesPath(), 'Courses.db');
      db = await openDatabase(
        path1,
        onCreate: (dB, v) {},
        version: 1,
      );
      return db!;
    } else {
      return db!;
    }
  }

  @override
  Future<List<String>> showCourses() async {
    Database db = await createDataBase();
    List mapForAllCourses =
        await db.rawQuery('SELECT * FROM sqlite_master ORDER BY NAME;');
    List<String> coursesNames = [];
    for (var courseMap in mapForAllCourses) {
      if (courseMap['name'] == 'android_metadata'||courseMap['name'].contains('WithDate')) {
        //don't do any thing :)
      } else {
        coursesNames.add(courseMap['name']);
      }
    }
    return coursesNames;
  }

  @override
  Future<void> addCourse(String courseName) async {
    Database? db = await createDataBase();
    await db.rawQuery(
        'create table $courseName(nationalId integer PRIMARY KEY ,name TEXT NOT NULL ,atendNumber integer)');
    await db.rawQuery(
        'create table ${courseName}WithDate(nationalId integer,date integer, CONSTRAINT PK_$courseName PRIMARY KEY (nationalId,date))');
  }

  @override
  Future<void> deleteCourse(String courseName) async {
    Database? db = await createDataBase();
    await db.rawQuery('DROP TABLE IF EXISTS $courseName');
    await db.rawQuery('DROP TABLE IF EXISTS ${courseName}WithDate');
  }
}