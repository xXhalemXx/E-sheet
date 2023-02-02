import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/general_use/general_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateNameButton extends StatelessWidget {

  final TextEditingController newDoctorName;
  final GlobalKey<FormState> formKey;
  final SharedPreferences prefs;

  const UpdateNameButton(
      {super.key,
      required this.newDoctorName,
      required this.formKey,
      required this.prefs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          updateNamePressed(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: const Text(
          'Update',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void updateNamePressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      prefs.setString('name', newDoctorName.text);
      FocusScopeNode currentFoucs = FocusScope.of(context);
      currentFoucs.unfocus();
     generalToast(context, 'updated successfully', AllColors.successToastColor);
     Navigator.pop(context);
      newDoctorName.text = '';
    }
  }


}
