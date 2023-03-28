import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/import_screen_widgets.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
}
