import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/no_courses_to_show_connection_dialog.dart';
import 'package:e_sheet/features/wifi_connection/presentation/widgets/connection_permission_granted/there_courses_to_connection_dialog.dart';
import 'package:flutter/material.dart';

class PermissionGrantedButton extends StatelessWidget {

  const PermissionGrantedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.5,
        child: RawMaterialButton(
          onPressed: (){
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return getIt<CoursesCubit>().courses.isEmpty
                      ? const NoCoursesToShow()
                      : CoursesToShowConnection();
                });
          },
          shape: const CircleBorder(),
          elevation: 3,
          fillColor:  Colors.blue,
          child:  Icon(
            Icons.wifi_tethering_outlined,
            color: Colors.white,
            size: MediaQuery.of(context).size.width*0.38,
          ),
        ),
      ),
    );
  }


}

