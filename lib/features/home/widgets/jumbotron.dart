import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tc_client_app/constants/global_variables.dart';
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
    return SizedBox(
      width: 1.sw,
      height: 0.55.sw,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageViewController ??= PageController(initialPage: 0),
            itemCount: _banneritems.length,
            itemBuilder: (context, index) =>
                SingleCardBanner(item: _banneritems[index]),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
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
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  spacing: 6.w,
                  radius: 16.r,
                  dotWidth: 10.w,
                  dotHeight: 10.h,
                  dotColor: const Color(0xFF9E9E9E),
                  activeDotColor: const Color(0xFFFAC13B),
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
