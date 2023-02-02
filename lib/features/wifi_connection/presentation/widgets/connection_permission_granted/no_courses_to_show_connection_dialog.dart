
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NoCoursesToShow extends StatelessWidget {
  const NoCoursesToShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('assets/pics/delete_widget.png',fit: BoxFit.fill,)),
          const AutoSizeText(
            'No courses to show',
            maxLines: 1,
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'ok',
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss alert dialog
          },
        ),
      ],
    );
  }
}

