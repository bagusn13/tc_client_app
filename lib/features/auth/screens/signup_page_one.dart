// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/common/widgets/custom_textbutton.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/auth/screens/signup_page_two.dart';
import 'package:tc_client_app/features/auth/widgets/background_auth_rev.dart';
import 'package:tc_client_app/features/auth/widgets/confirm_password_form.dart';
import 'package:tc_client_app/features/auth/widgets/email_form.dart';
import 'package:tc_client_app/features/auth/widgets/headerback.dart';
import 'package:tc_client_app/features/auth/widgets/password_form.dart';

class SignUpPageOne extends StatefulWidget {
  static const routeName = '/signupone';

  const SignUpPageOne({Key? key}) : super(key: key);

  @override
  State<SignUpPageOne> createState() => _SignUpPageOneState();
}

class _SignUpPageOneState extends State<SignUpPageOne> {
  final _signUpOneFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _signUpOneFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _signUpOneFocusNode.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    Navigator.pushNamed(context, SignUpPageTwo.routeName);
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
                    reverse: false,
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _signUpOneFormKey,
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
                                  'Buat akun baru',
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
                            height: 15.h,
                          ),
                          PasswordForm(
                            controller: _passwordController,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ConfirmPasswordForm(
                            confirmPassController: _confirmPasswordController,
                            passController: _passwordController,
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: CustomButton(
                              text: 'Selanjutnya',
                              fontSize: 18.sp,
                              onTap: () {
                                _navigateToNextPage();
                              },
                              size: Size(1.sw, 45.h),
                              borderRadius: 8.r,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sudah punya akun?',
                                style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: GlobalVariables.blackSoft1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                              CustomTextButton(
                                text: 'Masuk di sini',
                                fontSize: 14.sp,
                                onTap: () {
                                  Navigator.pop(context);
                                },
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
