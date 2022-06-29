// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/common/widgets/custom_textbutton.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/auth/screens/signup_page_one.dart';
import 'package:tc_client_app/features/auth/widgets/background_auth_rev.dart';
import 'package:tc_client_app/features/auth/widgets/email_form.dart';
import 'package:tc_client_app/features/auth/widgets/headerback.dart';
import 'package:tc_client_app/features/auth/widgets/password_form.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';

  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToSignUp() {
    Navigator.pushNamed(context, SignUpPageOne.routeName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: GlobalVariables.defaultGray,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            // const BackgroundAuthRev(),
            Scaffold(
              backgroundColor: GlobalVariables.defaultGray,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: <Widget>[
                          const HeaderBack(),
                          SizedBox(
                            height: 60.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat Datang',
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.lexendDeca(
                                    color: GlobalVariables.blackSoft1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          EmailForm(
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          PasswordForm(
                            controller: _passwordController,
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  text: 'Masuk',
                                  fontSize: 18.sp,
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                        .validate()) {
                                      print('valid');
                                    } else {
                                      print('no valid');
                                    }
                                  },
                                  size: Size(1.sw / 2.35, 45.h),
                                ),
                                CustomTextButton(
                                  text: 'Lupa Password?',
                                  onTap: () {},
                                  fontSize: 15.sp,
                                  size: Size(1.sw / 2.35, 45.h),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum punya akun?',
                                style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: GlobalVariables.blackSoft1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                              CustomTextButton(
                                text: 'Yuk daftar!',
                                fontSize: 14.sp,
                                onTap: _navigateToSignUp,
                                textColor: GlobalVariables.defaultOrange,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
