import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/add_button_widget.dart';
import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/text_field_add_course.dart';
import 'package:flutter/material.dart';



class AddCourseScreen extends StatelessWidget {

  final TextEditingController courseEnteredName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<Map<String,dynamic>> allStudents;
  AddCourseScreen({super.key,required this.allStudents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: backGroundColor(),
        child: GestureDetector(
          //to make keyboard disappear when press in any place on screen
          onTap: () {
            gestureDetectorTap(context);
          },
          child: Center(
            child: addCourseForm(context),
          ),
        ),
      ),
    );
  }

  Widget addCourseForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Sized Box Contain picture
          backGroundPicture(context),
          //Sized Box Contain text field and validator
          CourseNameFiled(courseEnteredName: courseEnteredName),
          //Sized Box to give align between text field and button
          const SizedBox(height: 10),
          //Sized Box Contain add button
          AddButton(courseEnteredName: courseEnteredName, formKey: formKey, allStudents: allStudents,),
        ],
      ),
    );
  }



  BoxDecoration backGroundColor() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff6DB3FE),
          Colors.lightBlueAccent,
          Colors.white54,

        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }

  Widget backGroundPicture(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.4,
      child: Image.asset('assets/pics/add_course.png'),
    );
  }

  gestureDetectorTap(BuildContext context) {
    FocusScopeNode currentFoucs=FocusScope.of(context);
    if(!currentFoucs.hasPrimaryFocus)
    {
      currentFoucs.unfocus();
    }
  }



}













