import 'package:flutter/material.dart';

class BackgroundPicture extends StatelessWidget {
  const BackgroundPicture({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image.asset('assets/pics/export.png'),
    );
  }
}
