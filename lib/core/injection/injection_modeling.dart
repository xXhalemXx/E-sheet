import 'package:e_sheet/features/courses/data/data_sources/local_database.dart';
import 'package:e_sheet/features/courses/data/repositories/courses_repositories_impl.dart';
import 'package:e_sheet/features/courses/domain/repositories/courses_repositories.dart';
import 'package:e_sheet/features/courses/domain/use_cases/add_course.dart';
import 'package:e_sheet/features/courses/domain/use_cases/delete_course.dart';
import 'package:e_sheet/features/courses/domain/use_cases/show_courses.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/students/data/local/data_sources/local_database_student.dart';
import 'package:e_sheet/features/students/data/repositories/students_repositories_impl.dart';
import 'package:e_sheet/features/students/domain/repositories/students_repositories.dart';
import 'package:e_sheet/features/students/domain/use_cases/add_student_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/delete_student_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/show_students_use_case.dart';
import 'package:e_sheet/features/students/domain/use_cases/update_student_use_case.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/data/local/data_sources/local_database_student_date.dart';
import 'package:e_sheet/features/wifi_connection/data/repositories/students_date_repositories%20_impl.dart';
import 'package:e_sheet/features/wifi_connection/domain/repositories/students_date_repositories.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/add_student_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/delete_student_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/domain/use_cases/show_students_date_use_case.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initGetIt() {

  //course cubit
  getIt.registerLazySingleton<CoursesCubit>(() => CoursesCubit(showCourses: getIt<ShowCourses>(), addCourse: getIt<AddCourse>(), deleteCourse: getIt<DeleteCourse>()));

  // course use cases
  getIt.registerLazySingleton<ShowCourses>(() => ShowCourses(coursesRepositories: getIt<CoursesRepositories>()));
  getIt.registerLazySingleton<AddCourse>(() => AddCourse(coursesRepositories: getIt<CoursesRepositories>()));
  getIt.registerLazySingleton<DeleteCourse>(() => DeleteCourse(coursesRepositories: getIt<CoursesRepositories>()));

  //course  repository
  getIt.registerLazySingleton<CoursesRepositories>(() => CourseRepositoriesImpl(coursesSource: getIt<CoursesSource>()));

  //data source
  getIt.registerLazySingleton<CoursesSource>(() => CoursesSourceImpl());

  //students cubit
  getIt.registerLazySingleton<StudentsCubit>(() => StudentsCubit(showStudents: getIt<ShowStudents>(), addStudentFun: getIt<AddStudent>(), deleteStudentFun: getIt<DeleteStudent>(), updateStudentFun: getIt<UpdateStudent>()));

  //students use cases
  getIt.registerLazySingleton<ShowStudents>(() => ShowStudents(studentsRepositories: getIt<StudentsRepositories>()));
  getIt.registerLazySingleton<AddStudent>(() => AddStudent(studentsRepositories: getIt<StudentsRepositories>()));
  getIt.registerLazySingleton<DeleteStudent>(() => DeleteStudent(studentsRepositories: getIt<StudentsRepositories>()));
  getIt.registerLazySingleton<UpdateStudent>(() => UpdateStudent(studentsRepositories: getIt<StudentsRepositories>()));

  // students repository
  getIt.registerLazySingleton<StudentsRepositories>(() => StudentsRepositoriesImpl(studentsSource: getIt<StudentsSource>()));

  //student data source
  getIt.registerLazySingleton<StudentsSource>(() => StudentSourceImpl());

  //local connection
  getIt.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  getIt.registerLazySingleton<ConnectionFunctions>(() => ConnectionFunctions());

  //studentsDate cubit
  getIt.registerLazySingleton<StudentsDateCubit>(() => StudentsDateCubit(showStudents: getIt<ShowStudentsDate>(), addStudentFun: getIt<AddStudentDate>(), deleteStudentFun: getIt<DeleteStudentDate>()));

  //studentsDate use cases
  getIt.registerLazySingleton<ShowStudentsDate>(() => ShowStudentsDate(studentsDataRepositories: getIt<StudentsDataRepositories>()));
  getIt.registerLazySingleton<AddStudentDate>(() => AddStudentDate(studentsDataRepositories: getIt<StudentsDataRepositories>()));
  getIt.registerLazySingleton<DeleteStudentDate>(() => DeleteStudentDate(studentsDateRepositories: getIt<StudentsDataRepositories>()));

  // studentsDate repository
  getIt.registerLazySingleton<StudentsDataRepositories>(() => StudentsDataRepositoriesImpl(studentsDataSource: getIt<StudentsDateSource>()));

  //studentDate data source
  getIt.registerLazySingleton<StudentsDateSource>(() => StudentDataSourceImpl());


}
