import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/themes/app_colors.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        centerTitle: true,
        elevation: 10,
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20.sp,
            fontFamily: GoogleFonts.roboto().fontFamily //ToDo change font
            ),
      ),
      // ToDo tapBarTheme
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.black,
            displayColor: AppColors.black,
            fontFamily: GoogleFonts.roboto().fontFamily, // ToDo change font
          ),
    );
  }

/* ******************************************************************************************************************************* */

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white, //use AppColors here
            displayColor: Colors.white, //use AppColors here
            fontFamily: GoogleFonts.roboto().fontFamily, //change font
          ),
    );
  }
}
