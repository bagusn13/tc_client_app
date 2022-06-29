import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/utils.dart';
import 'package:tc_client_app/models/region_model.dart';

class SingleCardRegion extends StatelessWidget {
  final RegionModel item;

  const SingleCardRegion({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(2, 5, 5, 2),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: screenWidth(context) / 2.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                item.imageUrl,
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}
