import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constant/app_constant.dart';
import '../../data/models/enum/theme_type.dart';
import 'app_controller.dart';

extension ThemeControllerExtension on AppController {
  Future<void> setThemeMode(ThemeType value) async {
    theme.value = value;
    themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(themeMode);
    await prefs.setString(AppConstant.themeApp, value.name);
    update();
  }

  ThemeMode getThemeModeFromString(ThemeType themeType) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (themeType == ThemeType.light) {
      _setThemeMode = ThemeMode.light;
    }
    if (themeType == ThemeType.dark) {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  void getThemeModeFromStore() async {
    final String _themeString = await prefs.getString(AppConstant.themeApp);
    setThemeMode(ThemeTypeExtension.parseThemeType(_themeString));
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (theme.value == ThemeType.dark) {
      return true;
    }
    return false;
  }
}
