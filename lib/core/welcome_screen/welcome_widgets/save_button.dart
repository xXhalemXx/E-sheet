import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/pages/main_page.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key,
    required this.formKey,
    required this.doctorName,
    required this.prefs
  });

  final TextEditingController doctorName;
  final GlobalKey<FormState> formKey;

  final SharedPreferences prefs;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool waiting=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery
            .of(context)
            .size
            .height * 0.12,
      ),
      child:waiting?const Center(child: CircularProgressIndicator(),): SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.09,
        child: RawMaterialButton(
          onPressed: () {
            saveButtonPressed(context);
          },
          fillColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: loginButtonBorderStyle),
          child: const Text('Continue', style: TextStyle(
              color: Color(0xff1AA7EC), fontWeight: FontWeight.bold),),

        ),
      ),
    );
  }

  BorderRadius get loginButtonBorderStyle =>
      const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        topLeft: Radius.circular(80),
      );

  void saveButtonPressed(BuildContext context) {

    if (widget.formKey.currentState!.validate()) {
      setState(() {
        waiting=true;
      });
      widget.prefs.setString('name', widget.doctorName.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: [
                  BlocProvider<CoursesCubit>(
                      create: (_) => getIt<CoursesCubit>()),
                  BlocProvider<StudentsCubit>(
                      create: (_) => getIt<StudentsCubit>()),
                ],
                child: MainPage(
                  prefs: widget.prefs,
                ),
              ),
        ),
      );
    }
  }
}