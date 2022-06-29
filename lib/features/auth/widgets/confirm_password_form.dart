import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class ConfirmPasswordForm extends StatefulWidget {
  final TextEditingController confirmPassController;
  final TextEditingController passController;

  const ConfirmPasswordForm({
    Key? key,
    required this.confirmPassController,
    required this.passController,
  }) : super(key: key);

  @override
  State<ConfirmPasswordForm> createState() => _ConfirmPasswordFormState();
}

class _ConfirmPasswordFormState extends State<ConfirmPasswordForm> {
  late bool _confirmPasswordErrVal;
  late bool _confirmPasswordVisibility;
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _confirmPasswordErrVal = false;
    _confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void onTapEye() {
    setState(() {
      _confirmPasswordVisibility = !_confirmPasswordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextFormField(
        focusNode: _confirmPasswordFocusNode,
        keyboardType: TextInputType.text,
        controller: widget.confirmPassController,
        obscureText: !_confirmPasswordVisibility,
        decoration: formDecorPassword(
          'Ketik ulang password',
          _confirmPasswordErrVal,
          onTapEye,
          _confirmPasswordVisibility,
        ),
        style: GoogleFonts.lexendDeca(
          color: const Color(0xFF2B343A),
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              _confirmPasswordErrVal = true;
            });
            return 'Password can\'t be empty';
          } else if (value != widget.passController.text) {
            setState(() {
              _confirmPasswordErrVal = true;
            });
            return 'Password not match';
          } else {
            setState(() {
              _confirmPasswordErrVal = false;
            });
            return null;
          }
        },
      ),
    );
  }
}
