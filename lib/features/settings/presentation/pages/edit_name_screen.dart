import 'package:e_sheet/features/settings/presentation/widgets/edit_name_widgets/ubdate_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key,required this.prefs});
  final SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateNameWidget(prefs: prefs,),
    );
  }
}
