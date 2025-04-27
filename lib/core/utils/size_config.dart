import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenWidth / 100;
  }

  static double scaledWidth(double inputWidth) {
    return (inputWidth / 375) * screenWidth;
  }

  static double scaledHeight(double inputHeight) {
    return (inputHeight / 812) * screenHeight;
  }
}
