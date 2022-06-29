import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
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
        preferredSize:
            Size.fromHeight(screenHeightPercentage(context, percentage: 0.11)),
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
      backgroundColor: GlobalVariables.defaultGray,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: false,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceCustom(context, 0.015),
              LoginButton(
                onTap: widget.onTapLogin,
              ),
              verticalSpaceCustom(context, 0.02),
              const Jumbotron(),
              verticalSpaceCustom(context, 0.025),
              const Categories(),
              verticalSpaceCustom(context, 0.03),
              const RegionSection(),
            ],
          ),
        ),
      ),
    );
  }
}
