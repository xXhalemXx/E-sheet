import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/activate_connection/activate_connection.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/activate_connection/load_local_network.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_no_permission/connection_no_permission.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/connection_permission_granted.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/Connection_functions.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/closing_warning_dialog.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/modify_attended_students/modify_attended_students.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/stop_connection/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {

  late String globalId;

  @override
  void initState() {

    super.initState();
    getIt<ConnectionCubit>().setupLocalConnection();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(


      onWillPop: () {
        return backButtonPressed(context);
      },
      child: Container(
          decoration: backGroundColor(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: BlocBuilder<ConnectionCubit, ConnectionStates>(
                  builder: (BuildContext context, state) {
                return state.when(connectionIdle: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, connectionNoPermission: () {
                  return const ConnectionNoPermissionWidget();
                }, connectionPermissionGranted: () {
                  return const ConnectionPermissionGrantedWidget();
                }, createLocalNetwork: () {
                  return const LoadLocalNetwork();
                }, connectionActivate: (connectedStudents) {
                  return ActivatedConnectionWidget(
                    connectedStudents: connectedStudents,
                  );
                }, modifyAttendedStudents: (List<Map<String, dynamic>> attendedStudents) {
                  return ModifyAttendedStudentsWidget(attendedStudents: attendedStudents);
                });
              }),
            ),
            floatingActionButton:const FloatingCloseButton(),
          )),
    );
  }



  BoxDecoration backGroundColor() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff6DB3FE),
          Colors.lightBlueAccent,
          Colors.lightBlueAccent,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }
}


Future<bool> backButtonPressed(BuildContext context) async{
  if(getIt<ConnectionCubit>().state is ConnectionActivate)
    {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const LocalNetworkWarning(msg:AllTexts.closeLocalNetwork ,);
      },
    );
    return false;
  }else if(getIt<ConnectionCubit>().state is ModifyAttendedStudents)
  {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const LocalNetworkWarning(msg:AllTexts.saveDataFirst ,);
      },
    );
    return false;
  }else {
    getIt.resetLazySingleton<ConnectionCubit>();
    getIt.resetLazySingleton<ConnectionFunctions>();
    return true;
  }

}
