import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/utils.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidthPercentage(context, percentage: 0.2),
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xCD383838),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo_with_slogan_crop.png',
                width: screenWidthPercentage(context, percentage: 0.5),
                height: screenWidthPercentage(context, percentage: 0.2),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
