import 'package:e_sheet/features/settings/presentation/widgets/edit_name_widgets/text_field_update_name.dart';
import 'package:e_sheet/features/settings/presentation/widgets/edit_name_widgets/update_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UpdateNameWidget extends StatelessWidget {

  final TextEditingController newDoctorName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SharedPreferences prefs;

  UpdateNameWidget({super.key,required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          UpdateNameFiled(newDoctorName: newDoctorName),
          //Sized Box to give align between text field and button
          const SizedBox(height: 10),
          //Sized Box Contain add button
         UpdateNameButton(newDoctorName: newDoctorName, formKey: formKey,prefs: prefs,),
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













