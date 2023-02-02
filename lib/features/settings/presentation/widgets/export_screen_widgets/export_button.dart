import 'dart:io';
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/settings/presentation/pages/export_screen.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: ()  {
          exportButtonPressed(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: AllColors.darkColorExport,
        ),
        child: const Text(AllTexts.export),
      ),
    );
  }

  exportButtonPressed(BuildContext context) async {
    String? courseName = ExportScreen.dropDownValue;
    if (courseName == null || courseName == '') {
      generalToast(context, AllTexts.selectFirst, AllColors.failedToastColor);
    } else {
      fillDataInColumns(courseName, context);
    }
  }

  fillDataInColumns(String courseName, BuildContext context,[bool mounted = true]) async {
   List<Map<String,dynamic>> students= await getIt<StudentsCubit>().getAllStudents(courseName);

          if (students.isEmpty) {
            if (!mounted) return;
            generalToast(
                context, AllTexts.emptyToExport, AllColors.failedToastColor);
          } else {
            //permission
            if (await checkStoragePermission()) {
              final Workbook workbook = Workbook();
              final Worksheet sheet = workbook.worksheets[0];
              //set header
              sheet.getRangeByName('B1').setText('اسم الطالب');
              sheet.getRangeByName('A1').setText('عدد مرات الحضور');
              //fill data
              int index = 2;
              for (var student in students) {
                sheet.getRangeByName('B$index').setText(student['name']);
                sheet
                    .getRangeByName('A$index')
                    .setValue(student['atendNumber']);
                index++;
              }
              sheet.autoFitColumn(1);
              sheet.autoFitColumn(2);
              //save file
              final List<int> bytes = workbook.saveAsStream();
              String pathToSore = await setLocationToStore();
              File('$pathToSore/$courseName.xlsx').writeAsBytes(bytes);
              workbook.dispose();
              if (!mounted) return;
              generalToast(
                  context, AllTexts.created, AllColors.successToastColor);
            }
            else{
              if (!mounted) return;
              generalToast(
                  context, AllTexts.noStoragePermission, AllColors.failedToastColor);
              await Permission.storage.request();
            }
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
    Directory('${newPath}Attendance Sheets').create();
    return '${newPath}Attendance Sheets';
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
}
