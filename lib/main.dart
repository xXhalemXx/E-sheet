import 'package:e_sheet/core/injection/injection_modeling.dart';
import 'package:e_sheet/core/welcome_screen/welcome_screen.dart';
import 'package:e_sheet/features/courses/presentation/manager/courses_cubit.dart';
import 'package:e_sheet/features/courses/presentation/pages/main_page.dart';
import 'package:e_sheet/features/students/presentation/manager/student_cubit.dart';
import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  initGetIt();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    assignFile();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Sheet',
      home: mainWidget(),
    );
  }

  Widget mainWidget() {
    return FutureBuilder(
      future: assignFile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return checkIfNull()
              ? WelcomeScreen(
            prefs: prefs,
          )
              : MultiBlocProvider(
            providers: [
              BlocProvider<CoursesCubit>(
                  create: (_) => getIt<CoursesCubit>()),
              BlocProvider<StudentsCubit>(
                  create: (_) => getIt<StudentsCubit>()),
              BlocProvider<StudentsDateCubit>(
                  create: (_) => getIt<StudentsDateCubit>()),
            ],
            child: MainPage(
              prefs: prefs,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  //check
  checkIfNull() {
    if (prefs.getString('name') == null || prefs.getString('name') == '') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> assignFile() async {
    prefs = await _prefs;
    await Future.delayed(const Duration(seconds: 1, milliseconds: 50));
    return true;
  }
}
