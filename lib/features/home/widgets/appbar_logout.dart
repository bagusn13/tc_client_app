import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/utils.dart';

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
            width: screenWidthPercentage(context, percentage: 0.45),
            height: screenWidthPercentage(context, percentage: 0.15),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
