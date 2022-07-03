import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/home/widgets/appbar_logout.dart';
import 'package:tc_client_app/features/home/widgets/login_button.dart';
import 'package:tc_client_app/features/home/widgets/categories.dart';
import 'package:tc_client_app/features/home/widgets/jumbotron.dart';
import 'package:tc_client_app/features/home/widgets/region_section.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  final Function onTapLogin;

  const HomePage({
    Key? key,
    required this.onTapLogin,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: GlobalVariables.defaultOrange,
          ),
          backgroundColor: GlobalVariables.defaultOrange,
          automaticallyImplyLeading: false,
          flexibleSpace: const AppbarLogout(),
          actions: const [],
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26.r),
            ),
          ),
        ),
      ),
      backgroundColor: GlobalVariables.defaultGray,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: false,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20.h),
                LoginButton(
                  onTap: widget.onTapLogin,
                ),
                SizedBox(height: 20.h),
                const Jumbotron(),
                SizedBox(height: 20.h),
                const Categories(),
                SizedBox(height: 20.h),
                const RegionSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
