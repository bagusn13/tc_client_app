import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarLogout extends StatelessWidget {
  const AppbarLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0.5),
          child: Image.asset(
            'assets/images/1500x1500_full_logo_white.png',
            width: 170.w,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
