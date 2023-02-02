import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/settings/presentation/pages/export_screen.dart';
import 'package:flutter/material.dart';

class ListOfCourses extends StatefulWidget {

   const ListOfCourses({super.key});

  @override
  State<ListOfCourses> createState() => _ListOfCoursesState();
}

class _ListOfCoursesState extends State<ListOfCourses> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          items: allItems(),
          onChanged: (value) {
            setState(() {
              ExportScreen.dropDownValue = value.toString();
            });
          },
          hint: const Text(AllTexts.selectCourseToExport),
          value: ExportScreen.dropDownValue,
          borderRadius: BorderRadius.circular(30),
          decoration: InputDecoration(
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AllColors.darkColorExport),
            ) ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),

          ),

        ),
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> allItems() {
    getIt<CoursesCubit>().emitReloadState();
    List<String> courses = getIt<CoursesCubit>().courses;
    return courses.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
          value: value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.book_outlined,
              ),
              Text(
                removeUnderscore(value),
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ));
    }).toList();
  }

  String removeUnderscore(String value) {
    List tempCourses = value.split('');
    String tempString = '';
    for (var x in tempCourses) {
      if (x != '_') {
        tempString += x;
      } else {
        tempString += ' ';
      }
    }
    return tempString;
  }
}
