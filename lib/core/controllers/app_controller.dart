import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/preference_manager_impl.dart';
import '../../data/models/enum/language_type.dart';
import '../../data/models/enum/theme_type.dart';
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
