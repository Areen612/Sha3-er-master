import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/service/theme/app_theme.dart';

import '../../../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// !!!!
class SimpleBtn extends StatelessWidget {
  const SimpleBtn({
    Key? key,
    required String btnTitle,
    required void Function()? onTap,
    double height = 40,
    //bool ltr = true,
  })  : _btnTitle = btnTitle,
        _onTap = onTap,
        _height = height,
        // _ltr = ltr,
        super(key: key);

  final double _height;
  final void Function()? _onTap;
  final String _btnTitle;
  //final bool _ltr;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: _onTap,
      child: Container(
        width: AppTheme.sw(context),
        height: _height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          // gradient: LinearGradient(
          //     colors: AppColors.primary,
          //     begin: _ltr ? Alignment.centerLeft : Alignment.centerRight,
          //     end: _ltr ? Alignment.centerRight : Alignment.centerLeft),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          _btnTitle.tr(),
          style: AppTheme.h5(context).copyWith(color: AppColors.bgWhite),
        ),
      ),
    );
  }
}
