import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/app_constant.dart';
import 'package:flutter_getx_base/data/local/preference_manager_impl.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final _theme = 'system'.obs;
  final prefs = PreferenceManagerImpl();
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  String get currentTheme => _theme.value;

  Future<void> setThemeMode(String value) async {
    _theme.value = value;
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await prefs.setString(AppConstant.themeApp, value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  void getThemeModeFromStore() async {
    final String _themeString = await prefs.getString(AppConstant.themeApp);
    setThemeMode(_themeString);
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance?.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }
}
