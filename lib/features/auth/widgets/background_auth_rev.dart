import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';

class BackgroundAuthRev extends StatelessWidget {
  const BackgroundAuthRev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GlobalVariables.defaultGray,
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Image.asset(
              'assets/images/Footer_AuthNew.png',
              width: screenWidth(context),
              height: screenHeightPercentage(context, percentage: 0.25),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
