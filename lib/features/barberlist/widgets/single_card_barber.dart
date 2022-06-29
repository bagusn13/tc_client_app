import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
import 'package:tc_client_app/models/barber_model.dart';

class SingleCardBarber extends StatelessWidget {
  final BarberModel item;
  const SingleCardBarber({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = screenWidth(context);
    double cardHeight = screenHeightPercentage(context, percentage: 0.21);
    double labelCardHeight = (cardHeight) * 0.4;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: GlobalVariables.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            item.imageUrl,
          ).image,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(2, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Container(
              width: cardWidth,
              height: labelCardHeight,
              decoration: const BoxDecoration(
                color: GlobalVariables.whiteTransparent1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: labelCardHeight * 0.4,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          item.name,
                          maxLines: 1,
                          style: GoogleFonts.lexendDeca(
                            color: GlobalVariables.blackSoft,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: labelCardHeight * 0.3,
                      child: FittedBox(
                        child: AutoSizeText(
                          item.address,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lexendDeca(
                            color: GlobalVariables.blackSoft,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.94, -0.92),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(),
              child: IconButton(
                splashColor: GlobalVariables.transparent,
                highlightColor: GlobalVariables.transparent,
                icon: const Icon(
                  Icons.star_outlined,
                  color: GlobalVariables.yellowStar,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
