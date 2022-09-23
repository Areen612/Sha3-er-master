import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFdddddd
  static Color _colorFromHex(String hexColor, [String opcity = 'FF']) {
    final String _color = hexColor.replaceAll('#', ''); // #FFFFFF ~> FFFFFF
    return Color(int.parse(opcity + _color, radix: 16));
  }

  static const Color white = Color.fromARGB(255, 250, 250, 250);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 158, 158, 158);
  static const Color darkTheme = Color.fromARGB(48, 48, 48, 0);
  static const Color blueGrey = Color.fromARGB(255, 95, 123, 138);
  static const Color mainBlueLight = Color.fromRGBO(206, 234, 255, 1);
  static const Color mainBlueDark = Color.fromRGBO(153, 212, 233, 100);
  static const Color lightLoading = Color.fromARGB(255, 252, 252, 252);
  static const Color darkLoading = Color.fromARGB(255, 80, 80, 80);

  //static final Color primary = _colorFromHex('#ABDBE3');
  static final Color primary = _colorFromHex('#58c8ff');
  static final Color primarybg = _colorFromHex('#F1F4F8');
  static final Color secondary = _colorFromHex('#ABDBE3');
  static final Color blueDetailsBG = _colorFromHex('#a2e7f5');
  static final Color darkMode = _colorFromHex('#3A3B3C');
  static final Color darkModeCardDetails = _colorFromHex('#484848');
  static final Color darkModeBodyDetails = _colorFromHex('#303030');
  static final Color lightModeInstallBtn = _colorFromHex('#456369');
  static final Color darkModeInstallBtn = _colorFromHex('#BB86FC');
  static final Color lightModeUnInstallBtn = _colorFromHex('#e95f44');
  static final Color darkModeUnInstallBtn = _colorFromHex('#FF0266');
  static final Color lightModeToast = _colorFromHex('#90ee02');
  static final Color darkModeToast = _colorFromHex('#BB86FC');
  static final Color mb = _colorFromHex('#FF0266');
  static final Color ceriseRed = _colorFromHex('#E1306C');

  static final Color red = _colorFromHex('#B71c1c');
  static final Color orange = _colorFromHex('#F57C00');
  static final Color blackCardSocial = _colorFromHex('#000000', '54');
  // * loading
  //static final Color lightLoading = _colorFromHex('#46B5F6');
  //static final Color darkLoading = _colorFromHex('#BB86FC');
  static final Color cardClick = _colorFromHex('#46B5F6');
  static final Color cardClickDark = _colorFromHex('#BB86FC');

  static final Color bgWhite = _colorFromHex('#FFFFFF');
  static final Color bgBlack = _colorFromHex('#000000');
  static final Color bgDark = _colorFromHex('#000000');
  static final Color bgCursor = _colorFromHex('#3A3B3C');
  static final Color bgGrey = _colorFromHex('#C8C8C8');
  static final Color bgGreen = _colorFromHex('#A5D6A7');
  static final Color bgGreenBold = _colorFromHex('#1B5E20');
  static final Color bgBlue = _colorFromHex('#2196F3');
  static final Color bgRed = _colorFromHex('#FD1D1D');

  static final Color primaryFont = _colorFromHex('#0F1113');
  static final Color secondaryFont = _colorFromHex('#57636C');
}
