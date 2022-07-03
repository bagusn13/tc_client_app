import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/models/region_model.dart';

class SingleCardRegion extends StatelessWidget {
  final RegionModel item;

  const SingleCardRegion({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
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
