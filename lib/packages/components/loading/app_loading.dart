import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shagher/packages/components/loading/enum_loading.dart';
import 'package:shagher/themes/app_colors.dart';

import '../../../service/theme/app_theme.dart';

class AppLoading extends StatelessWidget {
  const AppLoading(
      {Key? key,
      ChooseLoading chooseLoading = ChooseLoading.appLogo,
      double size = 45})
      : _chooseLoading = chooseLoading,
        _size = size,
        super(key: key);

  final ChooseLoading _chooseLoading;
  final double _size;

  @override
  Widget build(BuildContext context) {
    Color _colorLoading = AppTheme.isDark(context)
        ? AppColors.darkLoading
        : AppColors.lightLoading;
    switch (_chooseLoading) {
      case ChooseLoading.appLogo:
        return SpinKitFadingCircle(
          size: _size.w,
          color: _colorLoading,
        );
      case ChooseLoading.page:
        return SpinKitDoubleBounce(
          size: _size.w,
          color: _colorLoading,
        );
      case ChooseLoading.webView:
        return SpinKitPouringHourGlassRefined(
          size: _size.w,
          color: _colorLoading,
        );
      case ChooseLoading.profile:
        return SpinKitThreeBounce(
          size: _size.w,
          color: _colorLoading,
        );
      case ChooseLoading.button:
        return SpinKitFadingCircle(
          itemBuilder: (_, __) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary,
                //gradient: LinearGradient(colors: AppColors.btnColor),
                shape: BoxShape.circle,
              ),
            );
          },
          size: _size.sp,
        );
    }
  }
}
