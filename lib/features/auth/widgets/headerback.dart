import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        children: [
          SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xCD383838),
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo_with_slogan.png',
                height: 40.h,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
