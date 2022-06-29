import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/common/widgets/custom_textbutton.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/auth/widgets/background_auth_rev.dart';
import 'package:tc_client_app/features/auth/widgets/headerback.dart';

class OtpPage extends StatefulWidget {
  static const String routeName = '/otppage';

  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool hasError = false;
  bool hasExpired = false;
  String currentPin = "";
  final _otpFormKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final _errorController = StreamController<ErrorAnimationType>();

  @override
  void dispose() {
    _errorController.close();
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
              resizeToAvoidBottomInset: false,
              backgroundColor: GlobalVariables.defaultGray,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const HeaderBack(),
                          SizedBox(
                            height: 55.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Verifikasi OTP',
                                maxLines: 1,
                                style: GoogleFonts.lexendDeca(
                                  color: GlobalVariables.blackSoft1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 55.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              'Masukkan kode OTP yang telah dikirim ke email kamu',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexendDeca(
                                color: GlobalVariables.blackSoft1,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 70.h,
                            child: Form(
                              key: _otpFormKey,
                              child: PinCodeTextField(
                                appContext: context,
                                length: 4,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                keyboardType: TextInputType.number,
                                controller: _otpController,
                                errorAnimationController: _errorController,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                pinTheme: PinTheme(
                                  activeColor: GlobalVariables.borderColor,
                                  selectedColor: GlobalVariables.defaultOrange,
                                  inactiveColor: GlobalVariables.borderColor,
                                  disabledColor: GlobalVariables.borderColor,
                                  fieldWidth: 50.w,
                                  fieldHeight: 70.h,
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    currentPin = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55.h,
                          ),
                          Text(
                            "Tidak menerima kode OTP?",
                            style: GoogleFonts.lexendDeca(
                              color: GlobalVariables.blackSoft1,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          hasExpired
                              ? CustomTextButton(
                                  text: 'Kirim ulang kode',
                                  fontSize: 15.sp,
                                  onTap: () {},
                                  textColor: GlobalVariables.red,
                                )
                              : TweenAnimationBuilder(
                                  duration: const Duration(minutes: 2),
                                  tween: Tween(
                                      begin: const Duration(minutes: 2),
                                      end: Duration.zero),
                                  builder: (context, Duration value, child) {
                                    final minutes = value.inMinutes;
                                    final seconds = value.inSeconds % 60;
                                    return Text(
                                      '($minutes : $seconds)',
                                      style: GoogleFonts.lexendDeca(
                                          color: GlobalVariables.red,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    );
                                  },
                                  onEnd: () {
                                    setState(() {
                                      hasExpired = true;
                                    });
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.62),
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  color: GlobalVariables.defaultGray,
                  height: 110.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: CustomButton(
                            text: 'Verifikasi',
                            fontSize: 18.sp,
                            onTap: () {
                              _otpFormKey.currentState!.validate();
                              if (currentPin.length != 4) {
                                _errorController.add(ErrorAnimationType.shake);
                                setState(() {
                                  hasError = true;
                                });
                              } else {
                                setState(() {
                                  hasError = false;
                                });
                              }
                            },
                            size: Size(1.sw, 45.h),
                            borderRadius: 8.r,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
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
            )
          ],
        ),
      ),
    );
  }
}
