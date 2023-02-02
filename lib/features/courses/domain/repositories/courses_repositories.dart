abstract class CoursesRepositories{
  Future<List<String>> showCourses();
  Future<bool> addCourse(String courseName);
  Future<bool> deleteCourse(String courseName);
}