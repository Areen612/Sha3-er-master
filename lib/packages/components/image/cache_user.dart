import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/path_icons.dart';
import '../loading/app_loading.dart';
import '../loading/enum_loading.dart';

class CachedUser extends StatelessWidget {
  // defult image
  const CachedUser(
      {Key? key,
      String imageUser =
          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
      double width = 50,
      double height = 50})
      : _imageUser = imageUser,
        _height = height,
        _width = width,
        super(key: key);

  final String _imageUser;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: _imageUser,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: _width.w,
            height: _height.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) => const AppLoading(
              chooseLoading: ChooseLoading.profile,
            ),
        errorWidget: (context, url, error) {
          return Container(
            width: _width.w,
            height: _height.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(PathIcons.profileIcon),
              ),
            ),
          );
        });
  }
}
