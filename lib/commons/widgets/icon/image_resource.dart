import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageResource {
  ImageResource._();

  static SvgPicture svgImage(
    String assetName, {
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) =>
      SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
      );

  static Image pngImage(
    String assetName, {
    double? width,
    double? height,
  }) =>
      Image.asset(
        assetName,
        width: width,
        height: height,
      );
}
