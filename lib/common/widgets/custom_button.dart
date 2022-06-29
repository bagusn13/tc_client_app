import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Size? size;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonColor = GlobalVariables.defaultOrange,
    this.textColor = GlobalVariables.white,
    this.size = const Size(double.infinity, 50),
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: GoogleFonts.lexendDeca(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
