import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/models/banner_model.dart';

class SingleCardBanner extends StatelessWidget {
  final BannerModel item;

  const SingleCardBanner({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Container(
        width: 426.w,
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              item.imageUrl,
            ).image,
          ),
        ),
      ),
    );
  }
}
