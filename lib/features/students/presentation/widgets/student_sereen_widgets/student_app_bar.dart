import 'package:e_sheet/features/students/presentation/widgets/student_sereen_widgets/search_delegate.dart';
import 'package:flutter/material.dart';

class StudentAppBar extends AppBar {
  final String courseName;
  final bool enableSearch;

  StudentAppBar(
      {super.key, required this.courseName, required this.enableSearch});

  @override
  State<StudentAppBar> createState() => _StudentAppBarState();
}

class _StudentAppBarState extends State<StudentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(removeUnderscore(widget.courseName)),
      actions: widget.enableSearch
          ? [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate:
                            NewSearchDelegate(courseName: widget.courseName));
                  },
                  icon: const Icon(Icons.search)),
            ]
          : [],
    );
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
