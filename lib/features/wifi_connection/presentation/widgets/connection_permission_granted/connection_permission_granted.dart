import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/no_courses_to_show_connection_dialog.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/permission_granted_button.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/there_courses_to_connection_dialog.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/general_widgets/connection_header.dart';
import 'package:flutter/material.dart';

class ConnectionPermissionGrantedWidget extends StatelessWidget {
  const ConnectionPermissionGrantedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          const ConnectionHeader(headerText: 'press to start connection',textColor: Colors.white,),
          SizedBox(height:MediaQuery.of(context).size.height*0.28,),
         const PermissionGrantedButton()
      ],
    );
  }

  startConnection(BuildContext context,) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return getIt<CoursesCubit>().courses.isEmpty
              ? const NoCoursesToShow()
              : CoursesToShowConnection();
        });
  }
}
