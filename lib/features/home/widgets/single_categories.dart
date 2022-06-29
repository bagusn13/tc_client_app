import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';

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
    final double widthLogo = screenWidth(context) / 5.5;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: GlobalVariables.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              image,
              width: widthLogo,
              height: widthLogo,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: SizedBox(
              width: widthLogo,
              height: screenHeightPercentage(context, percentage: 0.028),
              child: FittedBox(
                alignment: Alignment.center,
                child: AutoSizeText(
                  categoryName,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: GlobalVariables.blackSoft1,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
