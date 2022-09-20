import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfigMaterial extends StatelessWidget {
  const ConfigMaterial({Key? key, required this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      ),
    );
  }
}
