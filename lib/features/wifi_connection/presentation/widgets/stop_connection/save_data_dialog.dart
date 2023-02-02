import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/domain/entities/student_entities.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SaveData extends StatelessWidget {
  final List<Map<String, dynamic>> attendedStudents;
  final String courseName;

  const SaveData(
      {super.key, required this.attendedStudents, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Cheak",
        style: TextStyle(color: Colors.green),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: attendedStudents.isEmpty
          ? const AutoSizeText("No one attended",maxLines: 2,)
          : attendedStudents.length == 1
              ? const AutoSizeText("Is there one student in the class")
              : AutoSizeText(
                  "Are there ${attendedStudents.length} students in the class"),
      actions: attendedStudents.isEmpty?
          [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  getIt<ConnectionCubit>().setupLocalConnection();
                  getIt.resetLazySingleton<ConnectionFunctions>();
                },
                child: const Text('Ok')),
          ]
          :[
        TextButton(
            onPressed: () {
              noPressed(context);
            },
            child: const Text('No')),
        TextButton(
            onPressed: () {
              yesPressed(courseName, context);
            },
            child: const Text('yes')),
      ],
    );
  }

  yesPressed(String courseName, BuildContext context) {
    for (var student in attendedStudents) {
      Student tempStudent = Student(
          name: student['name'],
          nationalId: student['nationalId'],
          atendNumber: (student['atendNumber'] + 1));
      getIt<StudentsCubit>().updateStudent(tempStudent, courseName);
    }
    Navigator.pop(context);
    getIt<ConnectionCubit>().setupLocalConnection();
    getIt.resetLazySingleton<ConnectionFunctions>();
  }

  noPressed(BuildContext context) {
    Navigator.pop(context);
    getIt<ConnectionCubit>().modifyAttendedStudents(attendedStudents);
  }
}
