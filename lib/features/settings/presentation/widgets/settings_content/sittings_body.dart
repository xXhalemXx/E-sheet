import 'package:e_sheet/features/settings/presentation/pages/about_screen.dart';
import 'package:e_sheet/features/settings/presentation/pages/edit_name_screen.dart';
import 'package:e_sheet/features/settings/presentation/pages/export_screen.dart';
import 'package:e_sheet/features/settings/presentation/pages/import_screens/import_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SittingsBody extends StatelessWidget {
  const SittingsBody({super.key,required this.prefs});
  final SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.67,
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.mode_edit_outline_outlined,
                  color: Colors.blue,
                ),
                Text('Name'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> EditNameScreen(prefs: prefs,)));
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.import_export,
                  color: Colors.blue,
                ),
                Text('Import'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const ImportScreen()));
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.file_download,
                  color: Colors.blue,
                ),
                Text('Save Course'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const ExportScreen()));

            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),
                Text('About'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}
