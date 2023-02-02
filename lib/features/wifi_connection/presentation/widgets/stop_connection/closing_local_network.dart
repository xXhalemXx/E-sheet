import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:flutter/material.dart';

closingLocalNetworkDialog(BuildContext context)
{
  showDialog(context: context, builder: (_){
    return const ClosingLocalNetwork();
  });
}
class ClosingLocalNetwork extends StatelessWidget {
  const ClosingLocalNetwork({super.key});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Closing",
        style: TextStyle(color: Colors.red),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: const Text("Are you sure about closing Local network?",textAlign: TextAlign.center,),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No')),
        TextButton(
            onPressed: () async{
              Navigator.pop(context);
              await getIt<ConnectionFunctions>().stopConnection(context);
            },
            child: const Text('yes')),
      ],
    );
  }
}
