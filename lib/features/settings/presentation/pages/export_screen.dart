import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/background_picture.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/export_button.dart';
import 'package:e_sheet/features/settings/presentation/widgets/export_screen_widgets/list_of_courses.dart';
import 'package:flutter/material.dart';

class ExportScreen extends StatelessWidget {
   const ExportScreen({super.key});
  static String? dropDownValue ;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: backGroundColor(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const  BackgroundPicture(),
                  const SizedBox(
                    height: 35,
                  ),
                   ListOfCourses(),
                  const SizedBox(
                    height: 10,
                  ),
                   ExportButton(),

                ],
              ),
            ),
          ),
        ));
  }

  BoxDecoration backGroundColor() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AllColors.firstColorExport,
          AllColors.secColorExport,
          AllColors.secColorExport,
          AllColors.lastColorExport,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }
}
