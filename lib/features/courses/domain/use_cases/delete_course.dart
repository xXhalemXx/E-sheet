import 'package:e_sheet/features/courses/domain/repositories/courses_repositories.dart';

class DeleteCourse{
  CoursesRepositories coursesRepositories;
  DeleteCourse({required this.coursesRepositories});

  Future<bool> call(String courseName) async{
    return await coursesRepositories.deleteCourse(courseName);
  }
}