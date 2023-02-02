import 'package:e_sheet/features/courses/domain/repositories/courses_repositories.dart';

class ShowCourses{
  CoursesRepositories coursesRepositories;
  ShowCourses({ required this.coursesRepositories});
  Future<List<String>> call() async{
   return await coursesRepositories.showCourses();
  }
}