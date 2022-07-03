import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/validator.dart';

class NameForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const NameForm({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  late bool _nameErrVal;
  final FocusNode _nameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameErrVal = false;
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _nameFocusNode,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      controller: widget.controller,
      obscureText: false,
      decoration: formDecorNormal(
        widget.label,
        _nameErrVal,
      ),
      style: GoogleFonts.lexendDeca(
        color: GlobalVariables.blackSoft1,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            _nameErrVal = true;
          });
          return 'First name can\'t be empty';
        } else if (value.length < 2) {
          setState(() {
            _nameErrVal = true;
          });
          return 'Too short';
        } else if (value.contains(' ')) {
          setState(() {
            _nameErrVal = true;
          });
          return 'Space not allowed';
        } else if (value.hasSpecialCharacters()) {
          setState(() {
            _nameErrVal = true;
          });
          return 'Special characters not allowed';
        } else if (value.hasDigits()) {
          setState(() {
            _nameErrVal = true;
          });
          return 'Number not allowed';
        } else {
          setState(() {
            _nameErrVal = false;
          });
          return null;
        }
      },
    );
  }
}
