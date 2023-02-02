import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/save_data_floating_button.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/stop_local_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingCloseButton extends StatelessWidget {
  const FloatingCloseButton({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ConnectionCubit, ConnectionStates>(
      builder: (BuildContext context, state) {
        if (state is ConnectionActivate) {
          return const StopLocalNetwork();
        } else if(state is ModifyAttendedStudents){

          return const SaveDataFloatingButton();
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
