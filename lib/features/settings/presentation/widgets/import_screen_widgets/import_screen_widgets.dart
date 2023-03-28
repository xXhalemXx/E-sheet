import 'package:e_sheet/features/settings/presentation/pages/import_screens/waiting_screen_for_import.dart';
import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/import_logic.dart';
import 'package:flutter/material.dart';
BoxDecoration backGroundColor() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Colors.grey,
        Colors.blue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

Center image(BuildContext context) {
  return Center(
    child: Image(
        image: const AssetImage('assets/pics/import1.png'),
        width: MediaQuery.of(context).size.width * 0.6),
  );
}

ElevatedButton importButton(BuildContext context,[bool mounted = true]) {
  return ElevatedButton(
    onPressed: () async {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const WaitingScreen()));
      var result =await readExelFile(context);
      if(result ==false){
        if (!mounted) return;
        Navigator.pop(context);
      }
    },
    style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.85,
            MediaQuery.of(context).size.height * 0.06),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    child: Text(
      'Select File',
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
    ),
  );
}