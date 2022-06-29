import 'package:flutter/material.dart';
import 'package:tc_client_app/models/banner_model.dart';

class SingleCardBanner extends StatelessWidget {
  final BannerModel item;

  const SingleCardBanner({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        item.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
