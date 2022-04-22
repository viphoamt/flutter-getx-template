import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyleApp {
  TextStyleApp._();

  static TextStyle? bodyText1({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      Theme.of(Get.context!).textTheme.bodyText1?.copyWith(
            fontFamily: 'Roboto',
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          );

  static TextStyle? bodyText2(
    BuildContext context, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      Theme.of(context).textTheme.bodyText2?.copyWith(
            fontFamily: 'Roboto',
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          );
}
