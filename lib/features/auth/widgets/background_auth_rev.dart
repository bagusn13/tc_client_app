import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class BackgroundAuthRev extends StatelessWidget {
  const BackgroundAuthRev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GlobalVariables.defaultGray,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/Footer_AuthNew.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
