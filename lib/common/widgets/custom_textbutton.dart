import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Size? size;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor = GlobalVariables.blackSoft1,
    this.size = const Size(double.infinity, 50),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        overlayColor: MaterialStateProperty.all(GlobalVariables.lightGray),
      ),
      child: AutoSizeText(
        text,
        style: GoogleFonts.lexendDeca(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
