import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tc_client_app/common/widgets/custom_button.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
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
            const BackgroundAuthRev(),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: GlobalVariables.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const HeaderBack(),
                          verticalSpaceCustom(context, 0.06),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeightPercentage(context,
                                    percentage: 0.04),
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'Verifikasi OTP',
                                    maxLines: 1,
                                    style: GoogleFonts.lexendDeca(
                                      color: GlobalVariables.blackSoft1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceCustom(context, 0.07),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SizedBox(
                              height: screenHeightPercentage(context,
                                  percentage: 0.04),
                              child: FittedBox(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  'Masukkan kode OTP yang telah dikirim ke email kamu',
                                  maxLines: 1,
                                  style: GoogleFonts.lexendDeca(
                                    color: GlobalVariables.blackSoft1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceCustom(context, 0.03),
                          SizedBox(
                            height: screenHeightPercentage(context,
                                percentage: 0.095),
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
                                  fieldWidth: screenWidthPercentage(context,
                                      percentage: 0.14),
                                  fieldHeight: screenWidthPercentage(context,
                                      percentage: 0.15),
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    currentPin = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          verticalSpaceCustom(context, 0.06),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: AutoSizeText(
                              "Tidak menerima kode OTP?",
                              style: GoogleFonts.lexendDeca(
                                color: GlobalVariables.blackSoft1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hasExpired
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                  child: TextButton(
                                    child: AutoSizeText(
                                      "Kirim ulang kode",
                                      style: GoogleFonts.lexendDeca(
                                        color: GlobalVariables.red,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        hasExpired = false;
                                      });
                                    },
                                  ),
                                )
                              : SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  child: TweenAnimationBuilder(
                                    duration: const Duration(minutes: 2),
                                    tween: Tween(
                                        begin: const Duration(minutes: 2),
                                        end: Duration.zero),
                                    builder: (context, Duration value, child) {
                                      final minutes = value.inMinutes;
                                      final seconds = value.inSeconds % 60;
                                      return AutoSizeText(
                                        '($minutes : $seconds)',
                                        style: GoogleFonts.lexendDeca(
                                            color: GlobalVariables.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      );
                                    },
                                    onEnd: () {
                                      setState(() {
                                        hasExpired = true;
                                      });
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.65),
              child: Material(
                type: MaterialType.transparency,
                child: SizedBox(
                  height: screenHeightPercentage(context, percentage: 0.145),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CustomButton(
                            text: 'Verifikasi',
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
                            size: Size(
                              screenWidth(context),
                              screenHeightPercentage(context, percentage: 0.06),
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
                            height: screenHeightPercentage(context,
                                percentage: 0.05),
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
            )
          ],
        ),
      ),
    );
  }
}
