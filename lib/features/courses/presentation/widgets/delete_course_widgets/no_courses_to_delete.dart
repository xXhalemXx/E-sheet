import 'package:e_sheet/core/general_use/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NoCoursesToDelete extends StatelessWidget{
  const NoCoursesToDelete({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          children: [
            Image.asset('assets/pics/delete_widget.png'),
            const SizedBox(height:10),
            const AutoSizeText(
              AllTexts.noCourseToDelete,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 90),
            ),
          ],
        ),
      ),
    );
  }

}