import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:flutter/material.dart';

class CoursesToShowConnection extends StatelessWidget {


  CoursesToShowConnection({Key? key,}) : super(key: key);
  final List<Widget> allCourses = [];

  @override
  Widget build(BuildContext context) {
    fillAllCourse(context);
    return SimpleDialog(
      title: const Text('Select Course'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      children: allCourses,
    );
  }

  fillAllCourse(BuildContext context) {
    String courseName;
    for (var course in getIt<CoursesCubit>().courses) {
      allCourses.add(
        SimpleDialogOption(
          onPressed: () async {
            Navigator.pop(context);
            getIt<ConnectionCubit>().waitingState();
            courseName = course;
            if(await getIt<ConnectionFunctions>().startConnection(courseName) ) {
              getIt<ConnectionCubit>().activateLocalNetwork({});
            }else{
              getIt<ConnectionCubit>().setupLocalConnection();
            }

          },
          child: Text(removeUnderscore(course)),
        ),
      );
    }
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
