import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/settings/presentation/pages/export_screen.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:excel/excel.dart';

exportButtonPressed(BuildContext context) async {
  String? courseName = ExportScreen.dropDownValue;
  if (courseName == null || courseName == '') {
    generalToast(context, AllTexts.selectFirst, AllColors.failedToastColor);
  } else {
     checkPermissionAndFillDta(courseName, context);
  }
}

Future<String> setLocationToStore() async {
  Directory? tempDir = await getExternalStorageDirectory();
  List<String> folders = tempDir!.path.split('/');
  String newPath = '';
  for (var folder in folders) {
    if (folder == 'Android') {
      break;
    }
    newPath += '$folder/';
  }
  Directory('${newPath}Download').create();
  Directory('${newPath}Download/Attendance Sheets').create();
  return '${newPath}Download/Attendance Sheets';
}

//handle permissions
Future<bool> checkStoragePermission() async {
  var status = await Permission.storage.status;

  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    return false;
  } else if (status.isPermanentlyDenied) {
    return false;
  } else {
    return false;
  }
}

//check
checkPermissionAndFillDta(String courseName, BuildContext context,
    [bool mounted = true]) async {
  List<Map<String, dynamic>> students =
      await getIt<StudentsCubit>().getAllStudents(courseName);
  if (students.isEmpty) {
    if (!mounted) return;
    generalToast(context, AllTexts.emptyToExport, AllColors.failedToastColor);
  } else {
    if (await checkStoragePermission()) {
      if (!mounted) return;
      await createFile(courseName, context);
    } else {
      if (!mounted) return;
      generalToast(
          context, AllTexts.noStoragePermission, AllColors.failedToastColor);
      await Permission.storage.request();
    }
  }
}

createFile(String courseName, BuildContext context) async {
  Excel excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];
  sheetObject.isRTL = true;
  await fillData(sheetObject, courseName, context, excel);
}

fillData(
    Sheet sheetObject, String courseName, BuildContext context, Excel excel,
    [bool mounted = true]) async {
  List<Map<String,dynamic>> students = await combineData(courseName);
  List<int> allDates =await getDifferentDates(courseName);
  allDates.sort();
  int dateIndex=2;
  //to set first 2 columns
  sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0,rowIndex: 0)).value = 'اسم ألطالب';//A1
  sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1,rowIndex: 0)).value = 'عدد مرات الحضور';//B1

  for(var date in allDates){
    sheetObject.updateCell(CellIndex.indexByColumnRow(columnIndex: dateIndex,rowIndex: 0),convertToDate(date),cellStyle: CellStyle(horizontalAlign: HorizontalAlign.Center));
    dateIndex++;
  }
  //fill data of specific course
  int tempDateIndex=2;
  int index = 2;
  for (var student in students) {
    sheetObject.updateCell(CellIndex.indexByString('A$index'), student['name']);
    sheetObject.updateCell(CellIndex.indexByString('B$index'), student['attendNum'],cellStyle: CellStyle(horizontalAlign: HorizontalAlign.Center));
    while(tempDateIndex <dateIndex){
      for(var date in student['attendDate']){
        if(allDates[(tempDateIndex-2)]==date){
          sheetObject.updateCell(CellIndex.indexByColumnRow(columnIndex: tempDateIndex,rowIndex: (index-1)),'✅',cellStyle: CellStyle(horizontalAlign: HorizontalAlign.Center,verticalAlign: VerticalAlign.Center));
          break;
        }
      }

      tempDateIndex++;
    }
    tempDateIndex=2;
    index++;
  }
  if (!mounted) return;
  await saveFile(excel, courseName, context);
}

saveFile(Excel excel, String courseName, BuildContext context,
    [bool mounted = true]) async {
  var fileBytes = excel.save();
  String filePath = await setLocationToStore();
  filePath += '/$courseName.xlsx';
  try {
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    if (!mounted) return;
    generalToast(
        context,
        'file generated successfully in\nfiles/Download/Attendance Sheets/$courseName.xlsx',
        AllColors.successToastColor,
        4);
  } catch (e) {
    if (!mounted) return;
    generalToast(context, e.toString(), AllColors.failedToastColor, 2);
  }
}

//combine
Future<List<Map<String, dynamic>>> combineData(String courseName) async {
  List<Map<String, dynamic>> allData = [];
  List<int> tempDate = [];
  List<Map<String, dynamic>> students =
      await getIt<StudentsCubit>().getAllStudents(courseName);
  List<Map<String, dynamic>> allStudentsWithDate =
      await getIt<StudentsDateCubit>().getAllStudents('${courseName}WithDate');

  for (var student in students) {
    for (var studentWithDate in allStudentsWithDate) {
      if (student['nationalId'] == studentWithDate['nationalId']) {
        tempDate.add(studentWithDate['date']);
      }
    }
    allData.add({
      'name': student['name'],
      'attendNum': student['atendNumber'],
      'attendDate': tempDate
    });
    tempDate = [];
  }
  return allData;
}

String convertToDate(int date) {
  DateTime convertedDate=DateTime.fromMillisecondsSinceEpoch(date);
  String sDate ='$convertedDate';
  String result='';
  for(var char in sDate.split(''))
  {
    if(char ==' '){
      break;
    }
    else{
      result+=char;
    }
  }
  return result;
}

Future<List<int>> getDifferentDates(String courseName) async{
  List<Map<String, dynamic>> allStudentsWithDate =
      await getIt<StudentsDateCubit>().getAllStudents('${courseName}WithDate');
  List<int> allDates=[];
  for(var student in allStudentsWithDate){
    if(!allDates.contains(student['date'])){
      allDates.add(student['date']);
    }
  }
  return allDates;
}