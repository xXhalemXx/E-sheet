import 'package:flutter/material.dart';

class LocalNetworkWarning extends StatelessWidget {
  final String msg;
  const LocalNetworkWarning({super.key,required this.msg});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      content:  Text(
        msg,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
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

