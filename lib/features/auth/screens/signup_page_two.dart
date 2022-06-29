import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
import 'package:tc_client_app/features/auth/screens/otp_page.dart';
import 'package:tc_client_app/features/auth/widgets/background_auth_rev.dart';
import 'package:tc_client_app/features/auth/widgets/headerback.dart';
import 'package:tc_client_app/features/auth/widgets/name_form.dart';
import 'package:tc_client_app/features/auth/widgets/phone_form.dart';

class SignUpPageTwo extends StatefulWidget {
  static const routeName = '/signuptwo';

  const SignUpPageTwo({Key? key}) : super(key: key);

  @override
  State<SignUpPageTwo> createState() => _SignUpPageTwoState();
}

class _SignUpPageTwoState extends State<SignUpPageTwo> {
  final _signUpTwoFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _signUpTwoFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _signUpTwoFocusNode.dispose();
    super.dispose();
  }

  void _navigateToOtpPage() {
    Navigator.pushNamed(context, OtpPage.routeName);
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
                      key: _signUpTwoFormKey,
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
                          NameForm(
                            controller: _firstNameController,
                            label: 'Nama Depan',
                          ),
                          verticalSpaceCustom(context, 0.016),
                          NameForm(
                            controller: _lastNameController,
                            label: 'Nama Belakang',
                          ),
                          verticalSpaceCustom(context, 0.016),
                          PhoneForm(controller: _phoneController),
                          verticalSpaceCustom(context, 0.04),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: CustomButton(
                              text: 'Daftar',
                              onTap: () {
                                _navigateToOtpPage();
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
                          verticalSpaceCustom(context, 0.022),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              alignment: Alignment.center,
                              color: GlobalVariables.transparent,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: AutoSizeText(
                                'By signing up, you agree to TempatCukur’s Terms of Service and Privacy Policy',
                                textAlign: TextAlign.justify,
                                maxLines: 2,
                                style: GoogleFonts.lexendDeca(
                                  color: GlobalVariables.blackSoft1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
