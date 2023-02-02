
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class NoCoursesToShow extends StatelessWidget{
  const NoCoursesToShow({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Image.asset('assets/pics/no-results.png'),
              const AutoSizeText(
                AllTexts.noCourses,
                maxLines: 1,
                style: TextStyle(color: AllColors.noCoursesHome, fontSize: 90),
              ),
            ],
          )),
    );
  }

}