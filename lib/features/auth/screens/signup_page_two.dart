import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/constants/global_variables.dart';
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
                      key: _signUpTwoFormKey,
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
                          NameForm(
                            controller: _firstNameController,
                            label: 'Nama Depan',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          NameForm(
                            controller: _lastNameController,
                            label: 'Nama Belakang',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          PhoneForm(controller: _phoneController),
                          SizedBox(
                            height: 28.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: CustomButton(
                              text: 'Daftar',
                              fontSize: 18.sp,
                              onTap: () {
                                _navigateToOtpPage();
                              },
                              size: Size(1.sw, 45.h),
                              borderRadius: 8.r,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              'By signing up, you agree to TempatCukur’s Terms of Service and Privacy Policy.',
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: GoogleFonts.lexendDeca(
                                color: GlobalVariables.blackSoft1,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
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
