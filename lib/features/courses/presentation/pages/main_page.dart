import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/widgets/add_course_widgets/add_course_widget.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/delete_course_screen.dart';
import 'package:e_sheet/features/courses/presentation/widgets/home_page_widgets/home_page.dart';
import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/bottom_bar.dart';
import 'package:e_sheet/features/settings/presentation/pages/settings_screen.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/pages/connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/mainPage';
  final SharedPreferences prefs;
   const MainPage({super.key,required this.prefs});


  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
    int _selectedIndex = 2;
  late Widget _selectedWidget;


  @override
  void initState() {
    _selectedWidget = const HomeScreen();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return backButtonPressed();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _selectedWidget,
        bottomNavigationBar: DiamondBottomNavigation(
          selectedColor: const Color(0xff1AA7EC),
          itemIcons: const [
            Icons.wifi_tethering_outlined,
            Icons.add_circle,
            Icons.delete_forever,
            Icons.settings,
          ],
          centerIcon: Icons.home,
          selectedIndex: _selectedIndex,
          onItemPressed: onPressed,
        ),
      ),
    );
  }

  Future<bool> backButtonPressed() async{
    if(_selectedIndex!=2){
      setState(() {
        _selectedIndex=2;
        _selectedWidget = const HomeScreen();
      });
      return false;
    }else {
      return true;
    }
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider<ConnectionCubit>(
                  create: (context) => getIt<ConnectionCubit>(),
                ),
                BlocProvider<CoursesCubit>(
                  create: (context) => getIt<CoursesCubit>(),
                )
              ],
              child: const ConnectionScreen(),
            )));
        _selectedWidget = const HomeScreen();
      } else if (index == 1) {
        _selectedWidget = AddCourseScreen();
      } else if (index == 2) {
        _selectedWidget = const HomeScreen();
      } else if (index == 3) {
        _selectedWidget =  DeleteCourseScreen();
      } else if (index == 4) {
       _selectedWidget =  SettingsScreen(prefs: widget.prefs,);
      }
    });
  }

}