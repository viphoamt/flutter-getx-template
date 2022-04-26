import 'package:flutter/material.dart';
import 'package:flutter_getx_base/data/local/preference_manager_impl.dart';
import 'package:flutter_getx_base/models/enum/language_type.dart';
import 'package:flutter_getx_base/models/enum/theme_type.dart';
import 'package:get/get.dart';

import 'language_controller_extension.dart';
import 'theme_controller_extension.dart';

class AppController extends GetxController {
  static AppController to = Get.find();
  final languageCode = LanguageType.english.obs;
  final theme = ThemeType.light.obs;
  final prefs = PreferenceManagerImpl();
  late ThemeMode themeMode;

  AppController() {
    getThemeModeFromStore();
    getSavedLanguageCode();
  }
}
