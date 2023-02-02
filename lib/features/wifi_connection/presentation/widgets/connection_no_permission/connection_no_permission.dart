import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_no_permission/no_permission_button.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/general_widgets/connection_header.dart';
import 'package:flutter/material.dart';

class ConnectionNoPermissionWidget extends StatelessWidget {
  const ConnectionNoPermissionWidget({Key? key}) : super(key: key);
  final String headerText = AllTexts.grantPermission;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConnectionHeader(headerText: headerText,textColor: Colors.white,),
        SizedBox(height:MediaQuery.of(context).size.height*0.28,),
        const NoPermissionButton()
        //child: localNetworkActive ? whileWorking() : startButton()),
      ],
    );
  }

}

