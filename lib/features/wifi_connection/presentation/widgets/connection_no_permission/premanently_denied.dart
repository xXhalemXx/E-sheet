
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:flutter/material.dart';

premanentlyDenied(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(
        AllTexts.error,
        style: TextStyle(
            color: Colors.red, fontSize: 25),
      ),
      content: const Text(
        AllTexts.premanentlyDenied,
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            AllTexts.ok,
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss alert dialog
          },
        ),
      ],
    );
  });
}