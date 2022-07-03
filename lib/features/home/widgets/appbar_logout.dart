import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarLogout extends StatelessWidget {
  const AppbarLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0.2),
      child: Image.asset(
        'assets/images/full_logo_white.png',
        height: 35.h,
      ),
    );
  }
}
