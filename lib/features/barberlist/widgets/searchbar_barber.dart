import 'package:flutter/material.dart';
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
      padding: const EdgeInsetsDirectional.fromSTEB(5, 20, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Container(
              height: 42,
              width: 42,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: GlobalVariables.transparent,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: GlobalVariables.defaultOrange,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 42,
              margin: const EdgeInsets.only(left: 10),
              color: GlobalVariables.lightGray,
              child: TextFormField(
                focusNode: _searchFocusNode,
                controller: widget.controller,
                obscureText: false,
                onChanged: widget.searchFunction,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 6,
                      ),
                      child: Icon(
                        Icons.search,
                        color: GlobalVariables.cadetGray,
                        size: 23,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(top: 10),
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: GlobalVariables.lightGray,
            height: 42,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: const Icon(
              Icons.map_outlined,
              color: GlobalVariables.defaultOrange,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
