import 'package:fluttertoast/fluttertoast.dart';

import '../../../themes/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void errorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.bgRed,
    textColor: AppColors.bgWhite,
    fontSize: 16.sp,
  );
}
