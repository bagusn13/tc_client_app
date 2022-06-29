// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/common/widgets/custom_textbutton.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
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
            const BackgroundAuthRev(),
            Scaffold(
              backgroundColor: GlobalVariables.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    reverse: false,
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _signUpOneFormKey,
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
                                      'Buat akun baru',
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
                          verticalSpaceCustom(context, 0.016),
                          PasswordForm(
                            controller: _passwordController,
                          ),
                          verticalSpaceCustom(context, 0.016),
                          ConfirmPasswordForm(
                            confirmPassController: _confirmPasswordController,
                            passController: _passwordController,
                          ),
                          verticalSpaceCustom(context, 0.04),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: CustomButton(
                              text: 'Selanjutnya',
                              onTap: () {
                                _navigateToNextPage();
                                // if (_signUpOneFormKey.currentState!
                                //     .validate()) {
                                //   print('valid');
                                // } else {
                                //   print('no valid');
                                // }
                              },
                              size: Size(
                                screenWidth(context),
                                screenHeightPercentage(
                                  context,
                                  percentage: 0.06,
                                ),
                              ),
                              borderRadius: 50,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeightPercentage(context,
                                    percentage: 0.025),
                                child: FittedBox(
                                  child: AutoSizeText(
                                    'Sudah punya akun?',
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: GlobalVariables.blackSoft1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              CustomTextButton(
                                text: 'Masuk di sini',
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
