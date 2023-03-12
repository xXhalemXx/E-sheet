import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/settings/presentation/pages/export_screen.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
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
      createAndSaveExelFile(courseName, context);
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

createAndSaveExelFile(String courseName, BuildContext context,[bool mounted = true]) async {
  List<Map<String, dynamic>> students = await getIt<StudentsCubit>()
      .getAllStudents(courseName);
  if (students.isEmpty) {
    if (!mounted) return;
    generalToast(
        context, AllTexts.emptyToExport, AllColors.failedToastColor);
  }else
  {
    if (await checkStoragePermission()) {

      var excel = Excel.createExcel();
      var sheetObject = excel['Sheet1'];
      sheetObject.isRTL = true;
      //to set first 2 columns
      sheetObject.cell(CellIndex.indexByString("A1")).value = 'اسم ألطالب';
      sheetObject.cell(CellIndex.indexByString("B1")).value = 'عدد مرات الحضور';
      //fill data of specific course
      int index = 2;
      for (var student in students) {
        sheetObject.cell(CellIndex.indexByString('A$index')).value=student['name'];
        sheetObject.cell(CellIndex.indexByString('B$index')).value=student['atendNumber'];
        index++;
      }
      var fileBytes = excel.save();
      String filePath = await setLocationToStore();
      filePath += '/$courseName.xlsx';

      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
      if (!mounted) return;
      generalToast(
          context,
          'file generated successfully in\nfiles/Download/Attendance Sheets/$courseName.xlsx',
          AllColors.successToastColor, 4);
    }
    else {
      if (!mounted) return;
      generalToast(
          context, AllTexts.noStoragePermission, AllColors.failedToastColor);
      await Permission.storage.request();
    }
  }


}

