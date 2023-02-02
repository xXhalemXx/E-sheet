import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.height * 0.05),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.85,
        child: const AutoSizeText('Welcome\nIn Electronic Attendance Sheet',
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
