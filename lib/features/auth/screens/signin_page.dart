// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/common/widgets/custom_textbutton.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
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
            const BackgroundAuthRev(),
            Scaffold(
              backgroundColor: GlobalVariables.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: <Widget>[
                          const HeaderBack(),
                          verticalSpaceCustom(context, 0.06),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeightPercentage(context,
                                      percentage: 0.04),
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: AutoSizeText(
                                      'Selamat Datang',
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.lexendDeca(
                                        color: GlobalVariables.blackSoft1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpaceCustom(context, 0.035),
                          EmailForm(
                            controller: _emailController,
                          ),
                          verticalSpaceCustom(context, 0.018),
                          PasswordForm(
                            controller: _passwordController,
                          ),
                          verticalSpaceCustom(context, 0.035),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  text: 'Masuk',
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                        .validate()) {
                                      print('valid');
                                    } else {
                                      print('no valid');
                                    }
                                  },
                                  size: Size(
                                    screenWidth(context) / 2.35,
                                    screenHeightPercentage(
                                      context,
                                      percentage: 0.05,
                                    ),
                                  ),
                                ),
                                CustomTextButton(
                                  text: 'Lupa Password?',
                                  onTap: () {},
                                  size: Size(
                                    screenWidth(context) / 2.35,
                                    screenHeightPercentage(
                                      context,
                                      percentage: 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpaceCustom(context, 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeightPercentage(context,
                                    percentage: 0.025),
                                child: FittedBox(
                                  child: AutoSizeText(
                                    'Belum punya akun?',
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: GlobalVariables.blackSoft1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              CustomTextButton(
                                text: 'Yuk daftar!',
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
