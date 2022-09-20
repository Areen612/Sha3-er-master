//import 'package:easy_localization/easy_localization.dart';
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    Key? key,
    required String title,
    required void Function() onTap,
    double width = 100,
    //required String height
    /*double radius = 120*/
  })  : _title = title,
        _onTap = onTap,
        _width = width,
        // _height = height,
        // _radius = radius,
        super(key: key);

  final String _title;
  final void Function() _onTap;
  final double _width;
  //final String _height;

  // final double _radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _onTap,
        style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.cardClick,
            backgroundColor: AppColors.primary,
            fixedSize: Size.fromWidth(_width.w),
            padding: const EdgeInsets.all(16)),
        child: Text(
          _title,
          style: TextStyle(
              color: AppColors.primarybg,
              fontFamily: 'Outfit',
              fontSize: 14.sp,
              fontStyle: FontStyle.normal),
        ) //tr(),
        );
  }
}
