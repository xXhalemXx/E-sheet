import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/closing_local_network.dart';
import 'package:flutter/material.dart';
class StopLocalNetwork extends StatelessWidget {
  const StopLocalNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          closingLocalNetworkDialog(context);
        },
        backgroundColor: Colors.red,
        tooltip: 'Stop Local Network',
        child: const Icon(Icons.power_settings_new_outlined));
  }
}
