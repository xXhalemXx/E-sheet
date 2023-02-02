import 'package:e_sheet/features/courses/data/data_sources/local_database.dart';
import 'package:e_sheet/features/courses/domain/repositories/courses_repositories.dart';

class CourseRepositoriesImpl implements CoursesRepositories{

  CoursesSource coursesSource;
  CourseRepositoriesImpl({required this.coursesSource});

  @override
  Future<bool> addCourse(String courseName) async{
    try{
     await coursesSource.addCourse(courseName);
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> deleteCourse(String courseName)async {
    try{
      await coursesSource.deleteCourse(courseName);
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<List<String>> showCourses() async{
    return await coursesSource.showCourses();
  }

}