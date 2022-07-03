import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/barberlist/widgets/listbuilder_barber.dart';
import 'package:tc_client_app/features/barberlist/widgets/searchbar_barber.dart';
import 'package:tc_client_app/models/barber_model.dart';

class BarberListPage extends StatefulWidget {
  static const String routeName = '/barberlist';

  const BarberListPage({Key? key}) : super(key: key);

  @override
  State<BarberListPage> createState() => _BarberListPageState();
}

class _BarberListPageState extends State<BarberListPage> {
  final TextEditingController _searchBarController = TextEditingController();

  List<BarberModel> barbers = GlobalVariables.dataBarber;

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  void searchBarber(String query) {
    final suggestions = GlobalVariables.dataBarber.where((item) {
      final name = item.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);
    }).toList();

    setState(() {
      barbers = suggestions;
    });
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
        child: Scaffold(
          backgroundColor: GlobalVariables.defaultGray,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SearchBar(
                    controller: _searchBarController,
                    searchFunction: searchBarber,
                  ),
                  ListBuilderBarber(
                    data: barbers,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
