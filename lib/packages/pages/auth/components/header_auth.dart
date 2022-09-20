import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/util/path_images.dart';

import '../../../../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({Key? key, double height = 150})
      : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: _height,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * arrow Back
            ModalRoute.of(context)?.canPop ?? false
                ? BackButton(color: AppColors.black)
                : Container(),
            const Spacer(),
            // * Logo
            Transform.scale(
              scale: 1.6.w,
              child: const Image(
                image: AssetImage(
                  PathImages.appLogo,
                ),
              ),
            ),
            Spacer(
              flex: ModalRoute.of(context)?.canPop ?? false ? 2 : 1,
            ),
          ],
        ),
      ),
    );
  }
}
