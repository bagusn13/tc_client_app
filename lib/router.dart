import 'package:flutter/material.dart';
import 'package:tc_client_app/common/widgets/mainscreen.dart';
import 'package:tc_client_app/features/auth/screens/otp_page.dart';
import 'package:tc_client_app/features/auth/screens/signin_page.dart';
import 'package:tc_client_app/features/auth/screens/signup_page_one.dart';
import 'package:tc_client_app/features/auth/screens/signup_page_two.dart';
import 'package:tc_client_app/features/splash/screens/splashscreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MainScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );
    case SigninPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SigninPage(),
      );
    case SignUpPageOne.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpPageOne(),
      );
    case SignUpPageTwo.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpPageTwo(),
      );
    case OtpPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OtpPage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
