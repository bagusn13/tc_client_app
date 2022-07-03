import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class LoginButton extends StatelessWidget {
  final Function onTap;

  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, sudah punya akun?',
                  style: GoogleFonts.poppins(
                    color: GlobalVariables.blackSoft1,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  'Tap di sini untuk masuk',
                  style: GoogleFonts.poppins(
                    color: GlobalVariables.blackSoft1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.account_circle_outlined,
            color: GlobalVariables.blackSoft1,
            size: 35,
          ),
        ],
      ),
    );
  }
}
