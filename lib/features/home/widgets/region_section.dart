import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/home/widgets/single_card_region.dart';
import 'package:tc_client_app/models/region_model.dart';

class RegionSection extends StatelessWidget {
  const RegionSection({Key? key}) : super(key: key);

  final List<RegionModel> regionitems = GlobalVariables.dataRegion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Mau cukur dimana hari ini?',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  color: GlobalVariables.blackSoft1,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            color: GlobalVariables.transparent,
            width: 1.sw,
            height: 140.w,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: regionitems.length,
              separatorBuilder: (context, _) => SizedBox(width: 10.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  SingleCardRegion(item: regionitems[index]),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
