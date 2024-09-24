import 'package:flutter/material.dart' show Radius;

class AppUIConstants {
  static double paddingBase = 4;

  static double marginBase = 4;

  static double defaultPadding = 16;

  static double majorScalePadding(double scale) => scale * paddingBase;

  static double majorScaleMargin(double scale) => scale * marginBase;

  static double radioButtonSize = 20;
  static double svgSize = 24;
  static double miniIconSize = 16;
  static double subButtonHeight = 40;
  static Radius subButtonRadius = const Radius.circular(10);

  static double checkboxIconSize = 18;
  static double chipIconSizeInAgriculturalSupplyCard = 16;
  static double smallIconSizeInFarmerCard = 16;
  static double normalIconSizeInFarmerCard = 22;
  static double tinyIconSize = 14.67;

  static double boxBorderRadius = 8;
  static double dialogBorderRadius = 24;
}
