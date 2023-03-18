import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/export_button_logic.dart';
import 'package:excel/excel.dart';

readExelFile(BuildContext context, [bool mounted = true]) async {
  List<Map<String, dynamic>> allStudents = [];
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  String filePath = await getFilePath(result);
  String fileName = await getFileName(result);
  String courseName = '';
  if (filePath != '') {
    if (await checkStoragePermission()) {
      var bytes = File(filePath).readAsBytesSync();
      Excel excel = Excel.decodeBytes(bytes);
      allStudents = saveStudentDataInMap(excel);
      courseName = saveCourseToDatabase(fileName);
      if (!mounted) return;
      fillDataInTheNewCourse(allStudents, context, courseName);
    } else {
      Permission.storage.request();
    }
  } else {
    if (!mounted) return;
    generalToast(context, 'No file selected', AllColors.failedToastColor);
  }
}

String saveCourseToDatabase(String fileName) {
  if(!checkIfCourseExist(replaceWhiteSpaceByUnderscore(fileName))) {

    getIt<CoursesCubit>().addNewCourse(replaceWhiteSpaceByUnderscore(fileName));
  return fileName;
  }
  else{
    return '';
  }
}

Future<String> getFileName(FilePickerResult? result) async {

  if (result != null) {
    return replaceWhiteSpaceByUnderscore(removeExtinction(result.files.single.name));
  } else {
    return '';
  }
}

Future<String> getFilePath(FilePickerResult? result) async {
  if (result != null) {
    return result.files.single.path!;
  } else {
    return '';
  }
}

List<Map<String, dynamic>> saveStudentDataInMap(Excel excel) {
  List<Map<String, dynamic>> allStudents = [];
  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print('number of columns:${excel.tables[table]?.maxCols}');
    print('number of Rows :${excel.tables[table]?.maxRows}');
    for (var row in excel.tables[table]!.rows) {
      allStudents.add(
          {'name': row.first?.value.toString(), 'studentNum': row.last?.value});
    }
  }
  return allStudents;
}

fillDataInTheNewCourse(List<Map<String, dynamic>> allStudents,
    BuildContext context, String courseName) {
  for (var element in allStudents) {
    //todo add cheak if id exist
    print(element);
      var student = Student(
          name: element['name'].toString(),
          nationalId: int.parse(element['studentNum'].toString()),
          atendNumber: 0);
      getIt<StudentsCubit>().addStudent(student, courseName);

  }
}

bool checkIfStudentIdExist(
    int studentNationalId, List<Map<String, dynamic>> allStudents) {
  bool isExist = false;

  for (var student in allStudents) {
    if (student['studentNum'] == studentNationalId) {
      isExist = true;

      break;
    }
  }
  return isExist;
}

bool checkIfCourseExist(String courseName) {
  bool result = false;
  List demoList = getIt<CoursesCubit>().courses;
  courseName = courseName.trim();

  for (var x in demoList) {
    if (x == replaceWhiteSpaceByUnderscore(courseName)) {
      result = true;
    }
  }
  return result;
}

//
String removeExtinction(String courseName){
  courseName = courseName.trim();
  List tempCourse = courseName.split('');
  courseName = '';
  for (var x in tempCourse) {
    if (x =='.') {
      break;
    }else{
      courseName += x;
    }
  }
  return courseName;
}

String replaceWhiteSpaceByUnderscore(String courseName) {
  courseName = courseName.trim();
  List tempCourse = courseName.split('');
  courseName = '';
  for (var x in tempCourse) {
    if (x != ' ') {
      courseName += x;
    } else {
      courseName += '_';
    }
  }
  return courseName;
}
