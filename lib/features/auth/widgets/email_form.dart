import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/validator.dart';

class EmailForm extends StatefulWidget {
  final TextEditingController controller;

  const EmailForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  late bool _emailErrVal;
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailErrVal = false;
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      obscureText: false,
      decoration: formDecorNormal(
        'Email',
        _emailErrVal,
      ),
      style: GoogleFonts.lexendDeca(
        color: GlobalVariables.blackSoft1,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            _emailErrVal = true;
          });
          return 'Email can\'t be empty';
        } else if (!(value.isValidEmail())) {
          setState(() {
            _emailErrVal = true;
          });
          return "Please enter valid email";
        } else {
          setState(() {
            _emailErrVal = false;
          });
          return null;
        }
      },
    );
  }
}
