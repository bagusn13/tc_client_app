import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/constants/utils.dart';
import 'package:tc_client_app/features/home/widgets/single_card_banner.dart';
import 'package:tc_client_app/models/banner_model.dart';

class Jumbotron extends StatefulWidget {
  const Jumbotron({Key? key}) : super(key: key);

  @override
  State<Jumbotron> createState() => _JumbotronState();
}

class _JumbotronState extends State<Jumbotron> {
  PageController? _pageViewController;
  final List<BannerModel> _banneritems = GlobalVariables.dataBanner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        width: screenWidth(context),
        height: screenWidthPercentage(context, percentage: 0.55),
        child: Stack(
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageViewController ??=
                  PageController(initialPage: 0),
              itemCount: _banneritems.length,
              itemBuilder: (context, index) =>
                  SingleCardBanner(item: _banneritems[index]),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SmoothPageIndicator(
                  controller: _pageViewController ??=
                      PageController(initialPage: 0),
                  count: _banneritems.length,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) {
                    _pageViewController!.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 6,
                    radius: 16,
                    dotWidth: 10,
                    dotHeight: 10,
                    dotColor: Color(0xFF9E9E9E),
                    activeDotColor: Color(0xFFFAC13B),
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
