import 'package:e_sheet/features/courses/domain/repositories/courses_repositories.dart';

class AddCourse{
  CoursesRepositories coursesRepositories;
  AddCourse({required this.coursesRepositories});

  Future<bool> call(String courseName) async{
    return await coursesRepositories.addCourse(courseName);
  }
}