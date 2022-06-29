import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tc_client_app/common/widgets/mainscreen.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  removeScreen() {
    return _timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          MainScreen.routeName, (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: GlobalVariables.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: GlobalVariables.white,
        body: Center(
          child: Image(
            width: screenWidthPercentage(context, percentage: 0.7),
            image: const AssetImage(
              "assets/images/tclogo.png",
            ),
          ),
        ),
      ),
    );
  }
}
