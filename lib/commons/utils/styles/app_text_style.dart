import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/colors.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    double fontSize = 14,
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    double height = 1,
    TextDecoration? decoration,
  }) : super(
          fontFamily: 'Roboto',
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          height: height,
          decoration: decoration,
        );

  const AppTextStyle.inactive({
    double fontSize = 14,
    double height = 1,
    FontWeight fontWeight = FontWeight.w400,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.inactiveText,
          height: height,
        );

  const AppTextStyle.correct({double fontSize = 12})
      : this(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: ColorConstants.correctText,
        );

  const AppTextStyle.error({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.error,
        );

  const AppTextStyle.white({
    double fontSize = 12,
    fontWeight = FontWeight.w600,
    height = 1.0,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
          height: height,
        );

  const AppTextStyle.title({
    double fontSize = 16,
    fontWeight = FontWeight.w600,
    Color color = ColorConstants.title,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );

  const AppTextStyle.bodyText({
    double fontSize = 12,
    fontWeight = FontWeight.w600,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.bodyText,
        );

  const AppTextStyle.placeholderText({
    double fontSize = 12,
    fontWeight = FontWeight.w600,
  }) : this(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.placeholderText,
        );
}
