import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String) searchFunction;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.searchFunction,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Container(
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: GlobalVariables.transparent,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: GlobalVariables.defaultOrange,
                size: 35,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50.h,
              margin: EdgeInsets.only(left: 10.w),
              color: GlobalVariables.lightGray,
              child: TextFormField(
                focusNode: _searchFocusNode,
                controller: widget.controller,
                obscureText: false,
                onChanged: widget.searchFunction,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 6.w,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: GlobalVariables.cadetGray,
                        size: 25,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  hintText: 'Cari TempatCukur..',
                  hintStyle: GoogleFonts.poppins(
                    color: GlobalVariables.cadetGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                style: GoogleFonts.lexendDeca(
                  color: GlobalVariables.blackSoft1,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          Container(
            color: GlobalVariables.lightGray,
            height: 50.h,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: const Icon(
              Icons.map_outlined,
              color: GlobalVariables.defaultOrange,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
