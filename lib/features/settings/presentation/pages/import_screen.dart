import 'package:e_sheet/features/settings/presentation/widgets/import_screen_widgets/import_logic.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Import Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(onPressed: (){
            readExelFile(context);
          },child: const Icon(Icons.read_more),),
    );
  }
}
