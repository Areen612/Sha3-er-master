import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shagher/util/path_icons.dart';
import 'package:shagher/util/path_images.dart';

class PathSvg {
  static final SvgPicture profileIcon = SvgPicture.asset(
    PathIcons.profileIcon,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture profileDarkIcon = SvgPicture.asset(
    PathIcons.profileDarkIcon,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture appLogo = SvgPicture.asset(
    PathImages.appLogo,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture languageIcon = SvgPicture.asset(
    PathIcons.languageIcon,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture themesIcon = SvgPicture.asset(
    PathIcons.themesIcon,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture termsAndConditionsIcon = SvgPicture.asset(
    PathIcons.termsAndConditionsIcon,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture dTranslate = SvgPicture.asset(
    PathIcons.language,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture dTheme = SvgPicture.asset(
    PathIcons.theme,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture dlogout = SvgPicture.asset(
    PathIcons.logout,
    width: 25.w,
    height: 25.h,
  );
  static final SvgPicture tourOne = SvgPicture.asset(
    PathImages.tourOne,
    width: 350.w,
    height: 300.h,
    fit: BoxFit.contain,
  );

  static final SvgPicture tourTwo = SvgPicture.asset(
    PathImages.tourTwo,
    width: 350.w,
    height: 300.h,
    fit: BoxFit.contain,
  );

  static final SvgPicture tourThree = SvgPicture.asset(
    PathImages.tourThree,
    width: 350.w,
    height: 300.h,
    fit: BoxFit.contain,
  );
}
