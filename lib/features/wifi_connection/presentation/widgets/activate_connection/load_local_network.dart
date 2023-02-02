import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/general_widgets/connection_header.dart';
import 'package:flutter/material.dart';

class LoadLocalNetwork extends StatelessWidget {
  const LoadLocalNetwork({super.key});
  final String headerText = AllTexts.createLocalNetwork;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ConnectionHeader(headerText: headerText,textColor: Colors.white,),
        ),
        const Expanded(
          flex: 6,
          child: Center (child: CircularProgressIndicator(),)
        )
      ],
    );
  }
}
