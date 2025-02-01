import 'dart:ui';

import 'package:todo/core/utils/fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getSmallStyle({double size = FontSize.s12, required Color color}) {
  return _getTextStyle(size, FontWeightManager.small, color);
}

TextStyle getMediumStyle({double size = FontSize.s14, required color}) {
  return _getTextStyle(size, FontWeightManager.medium, color);
}

TextStyle getlargeStyle({double size = FontSize.s18, required color}) {
  return _getTextStyle(size, FontWeightManager.smaiBold, color);
}
