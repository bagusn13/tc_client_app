import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class SingleCategory extends StatelessWidget {
  final String image;
  final String categoryName;
  final VoidCallback onTap;

  const SingleCategory({
    Key? key,
    required this.categoryName,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: GlobalVariables.transparent,
            elevation: 3,
            shape: const CircleBorder(),
            child: Image.asset(
              image,
              width: 65.w,
              height: 65.w,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              categoryName,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: GlobalVariables.blackSoft1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
