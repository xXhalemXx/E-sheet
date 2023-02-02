import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/attended_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInModify extends StatelessWidget {
  const SearchInModify({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fromRect(
      rect: Rect.fromCenter(
          center: Offset(MediaQuery.of(context).size.width * 0.5,
              MediaQuery.of(context).size.height * 0.138),
          width: MediaQuery.of(context).size.width*0.13,
          height: MediaQuery.of(context).size.height*0.2),
      child: SizedBox(
       // height: MediaQuery.of(context).size.height*0.5,
       // width: MediaQuery.of(context).size.width*0.8,
        child: RawMaterialButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: ModifySearchDelegate(),
            );
          },
          elevation: 0,
          fillColor: Colors.lightBlue,
          shape: const CircleBorder(),
          child: Icon(
            Icons.search,
            size: MediaQuery.of(context).size.width * 0.1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ModifySearchDelegate extends SearchDelegate {
  List<Map<String, dynamic>> suggestions = [];

  ModifySearchDelegate();

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
    return suggestions.isEmpty
        ? const Center(
            child: Text(
              "No student With this name",
              maxLines: 1,
            ),
          )
        : AttendedStudents(
            attendedStudents: suggestions,
            color: Colors.black26,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ConnectionCubit>(),
      child: BlocBuilder<ConnectionCubit, ConnectionStates>(
          builder: (context, state) {
        return state.when(connectionIdle: () {
          return const SizedBox();
        }, connectionNoPermission: () {
          return const SizedBox();
        }, createLocalNetwork: () {
          return const SizedBox();
        }, connectionPermissionGranted: () {
          return const SizedBox();
        }, connectionActivate: (_) {
          return const SizedBox();
        }, modifyAttendedStudents: (attendedStudents) {
          suggestions = [];
          for (var student in attendedStudents) {
            String studentName = student['name'].toString().toLowerCase();
            if (studentName.contains(query.toLowerCase()) && query.isNotEmpty) {
              suggestions.add(student);
            }
          }
          return suggestions.isEmpty
              ? const Center(
                  child: Text(
                    "No student With this name",
                    maxLines: 1,
                  ),
                )
              : AttendedStudents(
                  attendedStudents: suggestions,
                  color: Colors.black26,
                );
        });
      }),
    );
  }
}
