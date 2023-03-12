import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:flutter/material.dart';

class SaveDataFloatingButton extends StatelessWidget {
  const SaveDataFloatingButton({super.key});


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          await getIt<ConnectionFunctions>().stopConnection(context);
        },
        backgroundColor: Colors.blueAccent,
        tooltip: 'Stop Local Network',
        child: const Icon(Icons.save));
  }
}
