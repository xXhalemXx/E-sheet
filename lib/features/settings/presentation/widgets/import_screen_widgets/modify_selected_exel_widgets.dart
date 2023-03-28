import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_sheet/features/settings/presentation/pages/import_screens/add_course_screen_for_Import.dart';
import 'package:flutter/material.dart';

Row tableHeader() {
  return Row(
    children: const [
      Expanded(
          child: Text('Number',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center)),
      Expanded(
          child: Text('Name',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center)),
    ],
  );
}

ListView listOfData(List data, bool swap) {
  return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
                child: AutoSizeText(
              swap
                  ? data[index]['name'].toString()
                  : data[index]['studentNum'].toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
            )),
            Expanded(
                child: AutoSizeText(
              swap
                  ? data[index]['studentNum'].toString()
                  : data[index]['name'].toString(),
              textAlign: TextAlign.right,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        );
      });
}

Row screenButtons(
    BuildContext context, Function onPressSwap, List data, bool swap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      swapButton(onPressSwap),
      goNextButton(context, data, swap),
    ],
  );
}

FloatingActionButton swapButton(Function onPressSwap) {
  return FloatingActionButton(
    heroTag: const Text('Swap Button'),
    onPressed: () {
      onPressSwap();
    },
    backgroundColor: Colors.blueGrey,
    child: const Icon(Icons.cached),
  );
}

FloatingActionButton goNextButton(BuildContext context, List data, bool swap) {
  List<Map<String, dynamic>> allStudents = [];
  return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      heroTag: const Text('Go Next'),
      child: const Icon(Icons.open_in_new),
      onPressed: () {
        allStudents = refactorDataToList(data, swap);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => AddCourseScreen(allStudents: allStudents,)));
      });
}

refactorDataToList(List data, bool swap) {
  List<Map<String, dynamic>> allStudent = [];
  if (swap) {
    for (var element in data) {
      if (element['name'].toString() != 'null' &&
          element['studentNum'].toString() != 'null') {
        allStudent.add({
          'name': element['studentNum'].toString(),
          'studentNum': int.parse(element['name'].toString())
        });
      }
    }
  } else {
    for (var element in data) {
      if (element['name'].toString() != 'null' &&
          element['studentNum'].toString() != 'null') {
        allStudent.add({
          'name': element['name'].toString(),
          'studentNum': int.parse(element['studentNum'].toString())
        });
      }
    }
  }
  return allStudent;
}

BoxDecoration tableDecoration() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  );
}
