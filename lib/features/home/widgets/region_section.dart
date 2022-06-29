import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
import 'package:tc_client_app/features/home/widgets/single_card_region.dart';
import 'package:tc_client_app/models/region_model.dart';

class RegionSection extends StatelessWidget {
  const RegionSection({Key? key}) : super(key: key);

  final List<RegionModel> regionitems = GlobalVariables.dataRegion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: screenWidth(context),
        height: screenWidth(context) / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: screenHeightPercentage(context, percentage: 0.035),
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        'Mau cukur dimana hari ini?',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lexendDeca(
                          color: GlobalVariables.blackSoft1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth(context),
              height: screenWidth(context) / 2.5,
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
        ),
      ),
    );
  }
}
