import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';

class LoginButton extends StatelessWidget {
  final Function onTap;

  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            width: screenWidth(context) / 8,
            height: screenWidth(context) / 8,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/Login_user_blank.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeightPercentage(context, percentage: 0.03),
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Kamu belum masuk',
                      style: GoogleFonts.lexendDeca(
                        color: GlobalVariables.blackSoft1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeightPercentage(context, percentage: 0.023),
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Tap untuk masuk',
                      style: GoogleFonts.lexendDeca(
                        color: GlobalVariables.blackSoft1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
