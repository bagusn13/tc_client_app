import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/splash/screens/splashscreen.dart';
import 'package:tc_client_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TempatCukur.id',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.defaultGray,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.defaultOrange,
          secondary: GlobalVariables.lightGray,
        ),
        splashColor: GlobalVariables.lightGray,
        highlightColor: GlobalVariables.lightGray,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
