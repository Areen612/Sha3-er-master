import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';

InputDecoration fieldDecoration(BuildContext context,
    {labelText, hint, pIcon, sIcon, helperText, contentPadding}) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: hint,
    labelText: labelText,
    helperText: helperText,
    helperMaxLines: 3,
    errorMaxLines: 3,
    contentPadding: contentPadding,
    prefixIcon:
        // Padding(
        //padding: EdgeInsets.all(10.h),
        pIcon,
    //),
    suffixIcon: Padding(
      padding: EdgeInsets.all(10.h),
      child: sIcon,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
          color:
              AppTheme.isDark(context) ? AppColors.grey : AppColors.secondary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
          color:
              AppTheme.isDark(context) ? AppColors.primary : AppColors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.ceriseRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.ceriseRed),
    ),
  );
}
