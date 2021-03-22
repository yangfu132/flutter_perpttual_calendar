import 'PCCGloable.dart';
import 'package:flutter/material.dart';

class PCCContext {
  static double px2pt(double px) {
    return px / 2; //const_iPhone11_width;
  }

  static double px2ptFont(double px) {
    return px / 2; //const_iPhone11_width;
  }

  static double scale(double pt, context) {
    double _screenScale = screenWidth(context) / const_iPhone11_width;
    return pt * _screenScale;
  }

  static double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
