import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: GlobalVariables.transparent,
                height: 85.h,
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xCD383838),
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo_with_slogan_crop.png',
                height: 85.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
