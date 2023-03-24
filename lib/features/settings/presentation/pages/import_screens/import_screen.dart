import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/import_logic.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            image(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            importButton(context),
          ],
        ),
      ),
    );
  }

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

  ElevatedButton importButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await readExelFile(context);
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
}
