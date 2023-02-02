
import 'package:e_sheet/core/general_use/constant.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget{
  const MySliverAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.37;
    return SliverAppBar(
      backgroundColor: const Color(0xff1AA7EC),
      expandedHeight: appBarHeight,
      flexibleSpace:appBarContent(context),
      shape: sliverAppBareShape(),
    );
  }

  FlexibleSpaceBar appBarContent(BuildContext context){
    return  FlexibleSpaceBar(
      title: const Text(
        AllTexts.allCourses,
        style: TextStyle(
            fontSize: 15,
            fontFamily: ('KaushanScript'),
            color: AllColors.allCourses),
      ),
      titlePadding: const EdgeInsets.only(bottom: 4, left: 25),
      background: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.021),
        child: Image.asset(
          'assets/pics/home_background.png',
        ),
      ),
    );
  }

  RoundedRectangleBorder sliverAppBareShape() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)));
  }

}