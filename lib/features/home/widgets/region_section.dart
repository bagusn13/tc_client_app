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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                'Mau cukur dimana hari ini?',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  color: GlobalVariables.blackSoft1,
                  fontWeight: FontWeight.w600,
                  fontSize: 21.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 1.sw,
          height: 170.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: regionitems.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                SingleCardRegion(item: regionitems[index]),
          ),
        ),
      ],
    );
  }
}
