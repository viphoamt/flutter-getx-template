import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorConstants.darkPrimaryColor,
      appBarTheme: const AppBarTheme(
        color: ColorConstants.darkPrimaryColor,
        iconTheme: IconThemeData(color: ColorConstants.darkPrimaryColor),
      ),
      iconTheme: const IconThemeData(
        color: ColorConstants.lightPrimaryColor,
      ),
      textTheme: _buildTextTheme(ThemeData.dark()),
      backgroundColor: ColorConstants.lightPrimaryColor,
      dividerTheme: const DividerThemeData(color: Colors.black12),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: ColorConstants.lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        color: ColorConstants.lightPrimaryColor,
        iconTheme: IconThemeData(color: ColorConstants.lightPrimaryColor),
      ),
      iconTheme: const IconThemeData(
        color: ColorConstants.darkPrimaryColor,
      ),
      backgroundColor: ColorConstants.darkPrimaryColor,
      textTheme: _buildTextTheme(ThemeData.light()),
      dividerTheme: const DividerThemeData(color: Colors.black),
    );
  }

  static TextTheme _buildTextTheme(ThemeData themeData) {
    final textTheme = themeData.textTheme;

    return textTheme.copyWith(
      headline1: textTheme.headline1?.copyWith(fontSize: 90.0),
      headline2: textTheme.headline2?.copyWith(fontSize: 60.0),
      headline3: textTheme.headline3?.copyWith(fontSize: 48.0),
      headline4: textTheme.headline4?.copyWith(fontSize: 34.0),
      headline5: textTheme.headline5?.copyWith(fontSize: 24.0),
      headline6: textTheme.headline6?.copyWith(fontSize: 20.0),
      bodyText1: textTheme.bodyText1?.copyWith(fontSize: 16.0),
      bodyText2: textTheme.bodyText2?.copyWith(fontSize: 14.0),
    );
  }
}
