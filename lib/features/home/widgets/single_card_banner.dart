import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/models/banner_model.dart';

class SingleCardBanner extends StatelessWidget {
  final BannerModel item;

  const SingleCardBanner({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Container(
        width: 1.sw,
        height: 0.55.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              item.imageUrl,
            ).image,
          ),
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(30.r),
    //   child: Image.asset(
    //     item.imageUrl,
    //     fit: BoxFit.contain,
    //   ),
    // );
  }
}
