import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/validator.dart';

class PasswordForm extends StatefulWidget {
  final TextEditingController controller;

  const PasswordForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  late bool _passwordErrVal;
  late bool _passwordVisibility;
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordErrVal = false;
    _passwordVisibility = false;
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void onTapEye() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _passwordFocusNode,
      keyboardType: TextInputType.text,
      controller: widget.controller,
      obscureText: !_passwordVisibility,
      decoration: formDecorPassword(
        'Password',
        _passwordErrVal,
        onTapEye,
        _passwordVisibility,
      ),
      style: GoogleFonts.lexendDeca(
        color: const Color(0xFF2B343A),
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Password can\'t be empty';
        } else if (value.length < 6) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Password must be at least 6 characters';
        } else if (value.length > 16) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Password too long *max 16 characters';
        } else if (value.contains(' ')) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Space not allowed';
        } else if (value.hasSpecialCharacters()) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Special characters not allowed';
        } else if (!(value.hasDigits())) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Should contain at least one digit';
        } else if (!(value.hasLetter())) {
          setState(() {
            _passwordErrVal = true;
          });
          return 'Should contain at least one letter';
        } else {
          setState(() {
            _passwordErrVal = false;
          });
          return null;
        }
      },
    );
  }
}
