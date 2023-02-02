import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;


  static initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }

  double getDiamondSize() {
    var height = SizeConfig.screenHeight;
    if (height > 1000) {
      return 0.045 * SizeConfig.screenHeight;
    } else if (height >= 800) {
      return 0.055 * SizeConfig.screenHeight;
    } else if (height >= 500) {
      return 0.06 * SizeConfig.screenHeight;
    }else if (height >= 400) {
      return 0.07 * SizeConfig.screenHeight;
    } else {
      return 0.165 * SizeConfig.screenHeight;
    }
  }

  double getRelativeHeight() {
    var percentage = SizeConfig.screenHeight;
    if (percentage > 900) {
      return 0.04 * SizeConfig.screenHeight;
    } else if (percentage >= 800) {
      return 0.045 * SizeConfig.screenHeight;
    } else if (percentage >= 500) {
      return 0.055 * SizeConfig.screenHeight;
    }else if (percentage >= 400) {
      return 0.06 * SizeConfig.screenHeight;
    } else {
      return 0.145 * SizeConfig.screenHeight;
    }

  }

  double getRelativeWidth() {
    var percentage = SizeConfig.screenWidth;
    return percentage;
  }



}




