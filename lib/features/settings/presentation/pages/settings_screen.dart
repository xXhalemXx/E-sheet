import 'package:e_sheet/features/settings/presentation/widgets/settings_content/settings_header.dart';
import 'package:e_sheet/features/settings/presentation/widgets/settings_content/sittings_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key,required this.prefs});
  final SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
       SettingsHeader(prefs: prefs,),
        SittingsBody(prefs: prefs,),
      ],
    );
  }
}
