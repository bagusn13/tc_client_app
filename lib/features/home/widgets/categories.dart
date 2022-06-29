import 'package:flutter/material.dart';
import 'package:tc_client_app/features/barberlist/screens/barberlist_page.dart';
import 'package:tc_client_app/features/home/widgets/single_categories.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  void _navigateToBarberList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BarberListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleCategory(
            categoryName: 'Panggil',
            image: 'assets/images/Icon_1_Panggil.png',
            onTap: () {},
          ),
          SingleCategory(
            categoryName: 'Pesan',
            image: 'assets/images/Icon_2_Booking.png',
            onTap: () {
              _navigateToBarberList(context);
            },
          ),
          SingleCategory(
            categoryName: 'Franchise',
            image: 'assets/images/Icon_3_Franchise.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
