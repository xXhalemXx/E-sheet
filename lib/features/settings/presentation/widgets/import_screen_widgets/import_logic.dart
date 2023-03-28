import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/features/settings/presentation/pages/import_screens/modify_selected_exel.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/export_button_logic.dart';
import 'package:excel/excel.dart';

readExelFile(BuildContext context, [bool mounted = true]) async {
  List<Map<String, dynamic>> allStudents = [];
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
  String filePath = await getFilePath(result);
  try {
    if (filePath != '') {
      if (await checkStoragePermission()) {
        var bytes = File(filePath).readAsBytesSync();
        Excel excel = Excel.decodeBytes(bytes);
        allStudents = saveStudentDataInMap(excel);
        if (!mounted) return;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> ModifySelectedFile(allStudents: allStudents,)));
      } else {
        Permission.storage.request();
      }
    } else {
      if (!mounted) return;
      generalToast(context, 'No file selected', AllColors.failedToastColor);
      return false;
    }
  } catch (e) {
    if (!mounted) return;
    generalToast(context, e.toString(), AllColors.failedToastColor);
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
    for (var row in excel.tables[table]!.rows) {
      allStudents
          .add({'name': row.first?.value, 'studentNum': row.last?.value});
    }
  }
  return allStudents;
}
