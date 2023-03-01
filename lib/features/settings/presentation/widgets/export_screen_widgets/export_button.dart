import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/export_button_logic.dart';

import 'package:flutter/material.dart';


class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.07,
      child: ElevatedButton(
        onPressed: () {
          exportButtonPressed(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: AllColors.darkColorExport,
        ),
        child: const Text(AllTexts.export),
      ),
    );
  }

}