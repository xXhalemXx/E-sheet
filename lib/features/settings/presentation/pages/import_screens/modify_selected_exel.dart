import 'package:flutter/material.dart';

class ModifySelectedFile extends StatelessWidget {
  final List<Map<String, dynamic>> allStudents;

  const ModifySelectedFile({Key? key, required this.allStudents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('waiting our UI designer'),
    ));
  }
}
