import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/validator.dart';

class PhoneForm extends StatefulWidget {
  final TextEditingController controller;

  const PhoneForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  late bool _phoneErrVal;
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneErrVal = false;
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextFormField(
        focusNode: _phoneFocusNode,
        keyboardType: TextInputType.phone,
        controller: widget.controller,
        obscureText: false,
        decoration: formDecorNormal(
          'Nomor Telepon',
          _phoneErrVal,
        ),
        style: GoogleFonts.lexendDeca(
          color: GlobalVariables.blackSoft1,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              _phoneErrVal = true;
            });
            return 'Phone can\'t be empty';
          } else if (!(value.isValidPhone())) {
            setState(() {
              _phoneErrVal = true;
            });
            return "Please enter valid phone";
          } else {
            setState(() {
              _phoneErrVal = false;
            });
            return null;
          }
        },
      ),
    );
  }
}
