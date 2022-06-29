import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/models/banner_model.dart';
import 'package:tc_client_app/models/barber_model.dart';
import 'package:tc_client_app/models/region_model.dart';

String uri = 'http://192.168.1.9:3000';

class GlobalVariables {
  // COLORSs
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const defaultOrange = Color(0xFFFF7400);
  static const borderColor = Color(0xFFDBE2E7);
  static const borderErrorColor = Colors.redAccent;
  static const red = Colors.red;
  static const brightRed = Color(0xFFF60105);
  static const white = Colors.white;
  static const defaultGray = Color(0xFFF4F4F4);
  static const cadetGray = Color(0xFF95A1AC);
  static const transparent = Colors.transparent;
  static const blackSoft = Color(0xFF262626);
  static const blackSoft1 = Color(0xFF373535);
  static const richBlack = Color(0xFF090F13);
  static const whiteTransparent1 = Color.fromARGB(162, 255, 255, 255);
  static const yellowStar = Color(0xFFFFA700);
  static const lightGray = Color(0xFFEDEDED);

  static const defaultDelay = Duration(milliseconds: 200);

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'assets/images/Promo_4A.png',
    'assets/images/Promo_5A.png',
    'assets/images/Promo_2A.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  // STATIC DATA
  static const dataBarber = [
    BarberModel(
      name: 'Barber 1',
      address: 'Jl. Kebon Jeruk No.1',
      imageUrl: 'assets/images/barber3.jpg',
    ),
    BarberModel(
      name: 'Barber 2',
      address: 'Jl. Kebon Jeruk No.2',
      imageUrl: 'assets/images/barber2.jpg',
    ),
    BarberModel(
      name: 'Barber 3',
      address: 'Jl. Kebon Jeruk No.3',
      imageUrl: 'assets/images/barber3.jpg',
    ),
    BarberModel(
      name: 'Barber 4',
      address: 'Jl. Kebon Jeruk No.4',
      imageUrl: 'assets/images/barber3.jpg',
    ),
    BarberModel(
      name: 'Barber 5',
      address: 'Jl. Kebon Jeruk No.5',
      imageUrl: 'assets/images/barber2.jpg',
    ),
    BarberModel(
      name: 'Barber 6',
      address: 'Jl. Kebon Jeruk No.6',
      imageUrl: 'assets/images/barber3.jpg',
    ),
  ];

  static const dataBanner = [
    BannerModel(imageUrl: 'assets/images/Promo_4A.png'),
    BannerModel(imageUrl: 'assets/images/Promo_2A.png'),
    BannerModel(imageUrl: 'assets/images/Promo_3A.png'),
    BannerModel(imageUrl: 'assets/images/Promo_5A.png'),
    BannerModel(imageUrl: 'assets/images/Promo_1A.png'),
  ];

  static const dataRegion = [
    RegionModel(imageUrl: 'assets/images/Kota_Jakarta.png'),
    RegionModel(imageUrl: 'assets/images/Kota_Malang.png'),
    RegionModel(imageUrl: 'assets/images/Kota_Makassar.png'),
    RegionModel(imageUrl: 'assets/images/Kota_Cirebon.png'),
  ];
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(
      color: GlobalVariables.borderColor,
    ),
  );
}

OutlineInputBorder outlineFieldNormal() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(
      color: GlobalVariables.borderColor,
      width: 2,
    ),
  );
}

OutlineInputBorder outlineFieldError() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(
      color: GlobalVariables.borderErrorColor,
      width: 2,
    ),
  );
}

InputDecoration formDecorNormal(String labelText, bool errVal) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: GoogleFonts.lexendDeca(
      color:
          errVal ? GlobalVariables.borderErrorColor : GlobalVariables.cadetGray,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
    enabledBorder: outlineFieldNormal(),
    focusedBorder: outlineFieldNormal(),
    errorBorder: outlineFieldError(),
    focusedErrorBorder: outlineFieldError(),
    filled: true,
    fillColor: GlobalVariables.white,
    contentPadding: EdgeInsets.only(left: 16.w),
  );
}

InputDecoration formDecorPassword(
    String labelText, bool errVal, VoidCallback onTap, bool visibility) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: GoogleFonts.lexendDeca(
      color: errVal ? Colors.redAccent : const Color(0xFF95A1AC),
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
    enabledBorder: outlineFieldNormal(),
    focusedBorder: outlineFieldNormal(),
    errorBorder: outlineFieldError(),
    focusedErrorBorder: outlineFieldError(),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.only(
      left: 16.w,
      right: 24.w,
    ),
    suffixIcon: InkWell(
      onTap: onTap,
      child: Icon(
        visibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: const Color(0xFF95A1AC),
        size: 22,
      ),
    ),
  );
}

SystemUiOverlayStyle statusBarLight() {
  return const SystemUiOverlayStyle(
    statusBarColor: GlobalVariables.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );
}

SystemUiOverlayStyle statusBarLightGray() {
  return const SystemUiOverlayStyle(
    statusBarColor: GlobalVariables.defaultGray,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );
}
