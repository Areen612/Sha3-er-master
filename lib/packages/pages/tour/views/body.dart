import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/pages/auth/view/wrapper.dart';
import 'package:shagher/packages/pages/tour/componets/tour_card.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/path_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/button/elevated_btn.dart';

class TourWidget extends StatefulWidget {
  static const id = 'TourWidget';
  const TourWidget({Key? key}) : super(key: key);

  @override
  State<TourWidget> createState() => _TourWidgetState();
}

class _TourWidgetState extends State<TourWidget> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgBlue,
      body: Container(
        color: AppColors.primarybg,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                //todo texts and tr()
                children: <Widget>[
                  TourCard(
                    image: PathSvg.tourOne,
                    title: KeyLang.tourHeaderOne.tr(),
                    // subtitle:
                    //     'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua. '
                  ),
                  TourCard(
                    image: PathSvg.tourTwo,
                    title: KeyLang.tourHeaderTwo.tr(),
                    // subtitle:
                    //     'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua. '
                  ),
                  TourCard(
                    image: PathSvg.tourThree,
                    title: KeyLang.tourHeaderThree.tr(),
                    // subtitle:
                    //     'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua. '
                  ),
                ],
              ),
            ),
            SBH(h: 30.h),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: SwapEffect(
                dotWidth: 12.w,
                dotHeight: 12.h,
                activeDotColor: AppColors.black,
                dotColor: AppColors.grey,
              ),
            ),
            SBH(h: 20.h),
            ElevatedBtn(
              title: KeyLang.getStarted.tr(),
              onTap: () {
                Navigator.pushReplacementNamed(context, Wrapper.id);
              },
              width: 300,
            ),
            SBH(h: 40.h),
          ],
        ),
      ),
    );
  }
}
