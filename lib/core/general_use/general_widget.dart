import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void generalToast(BuildContext context,String str,Color toastColor,[int seconds=1]){
  showToast(str,
      position: StyledToastPosition.top,
      context: context,
      textStyle: const TextStyle(fontSize: 14,color: Colors.white),
      backgroundColor: toastColor,
      borderRadius: BorderRadius.circular(25),
      duration:  Duration(seconds: seconds,milliseconds: 700),
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop);
}


