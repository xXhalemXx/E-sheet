import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/students/presentation/manager/student_state.dart';
import 'package:e_sheet/features/students/presentation/widgets/students_list/student_style_tail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSearchDelegate extends SearchDelegate {
  final String courseName;
  List<Map<String, dynamic>> suggestions = [];

  NewSearchDelegate({required this.courseName});

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
    return BlocProvider.value(
      value: getIt<StudentsCubit>(),
      child:
          BlocBuilder<StudentsCubit, StudentStates>(builder: (context, state) {
        return state.when(studentInitialState: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, reloadedStudents: (allStudents) {
          suggestions = [];

          if (query.isNotEmpty) {
            for (var student in allStudents) {
              String studentName = student['name'].toString().toLowerCase();
              String searchValue = query.toLowerCase();
              if (studentName.contains(searchValue)) {
                suggestions.add(student);
              }
            }
          }

          return suggestions.isNotEmpty
              ? ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: StudentListTail(
                        studentName: suggestions[index]['name'],
                        studentAtendNum: suggestions[index]['atendNumber'],
                        studentNationalId: suggestions[index]['nationalId'],
                        courseName: courseName,
                      ),
                    );
                  })
              : const Center(
                  child: Text(
                    AllTexts.noStudentsToShow,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                );
        });
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider.value(
      value: getIt<StudentsCubit>(),
      child:
          BlocBuilder<StudentsCubit, StudentStates>(builder: (context, state) {
        return state.when(studentInitialState: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, reloadedStudents: (allStudents) {
          suggestions = [];

          if (query.isNotEmpty) {
            for (var student in allStudents) {
              String studentName = student['name'].toString().toLowerCase();
              String searchValue = query.toLowerCase();
              if (studentName.contains(searchValue)) {
                suggestions.add(student);
              }
            }
          }

          return suggestions.isNotEmpty
              ? ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: StudentListTail(
                        studentName: suggestions[index]['name'],
                        studentAtendNum: suggestions[index]['atendNumber'],
                        studentNationalId: suggestions[index]['nationalId'],
                        courseName: courseName,
                      ),
                    );
                  })
              : const Center(
                  child: Text(
                    AllTexts.noStudentsToShow,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                );
        });
      }),
    );
  }
}
