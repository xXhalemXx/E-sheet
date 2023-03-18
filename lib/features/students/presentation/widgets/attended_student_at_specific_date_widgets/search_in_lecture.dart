import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';

class NewSearchInLecDelegate extends SearchDelegate {
  final String courseName;
  final List<int> allStudentsNum;
  List<String> suggestions = [];

  NewSearchInLecDelegate(
      {required this.courseName, required this.allStudentsNum});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getStudentsName(courseName, allStudentsNum),
        builder: (_, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            suggestions = [];

            if (query.isNotEmpty) {
              for (var student in asyncSnapshot.data!) {
                String studentName = student.toString().toLowerCase();
                String searchValue = query.toLowerCase();
                if (studentName.contains(searchValue)) {
                  suggestions.add(student);
                }
              }
            }
            return suggestions.isEmpty ? const Center(
              child: Text(
                AllTexts.noStudentsToShow,
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
            ): thereStudentsToShow(suggestions,courseName);
          }else{
          return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: getStudentsName(courseName, allStudentsNum),
        builder: (_, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            suggestions = [];

            if (query.isNotEmpty) {
              for (var student in asyncSnapshot.data!) {
                String studentName = student.toString().toLowerCase();
                String searchValue = query.toLowerCase();
                if (studentName.contains(searchValue)) {
                  suggestions.add(student);
                }
              }
            }
            return suggestions.isEmpty ? const Center(
              child: Text(
                AllTexts.noStudentsToShow,
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
            ): thereStudentsToShow(suggestions,courseName);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView thereStudentsToShow(List<String>? students, String courseName) {
    return ListView.builder(
        itemCount: students!.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: studentsTail(students[index]),
          );
        });
  }

  Widget studentsTail(String studentName) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        tileColor: Colors.grey.shade200,
        title: Center(
          child: AutoSizeText(
            studentName,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  Future<List<String>> getStudentsName(String courseName,
      List<int> allStudentsNum) async {
    var allStudents = await getIt<StudentsCubit>().getAllStudents(courseName);
    List<String> attendedStudents = [];
    for (var student in allStudents) {
      if (allStudentsNum.contains(student['nationalId'])) {
        attendedStudents.add(student['name']);
      }
    }

    return attendedStudents;
  }
}


/*const Center(
            child: Text(
              AllTexts.noStudentsToShow,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          );*/