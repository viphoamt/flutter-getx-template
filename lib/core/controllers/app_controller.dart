import 'package:flutter/material.dart';
import 'package:flutter_getx_base/data/local/preference_manager_impl.dart';
import 'package:flutter_getx_base/localization/localization_service.dart';
import 'package:flutter_getx_base/models/enum/theme_type.dart';
import 'package:get/get.dart';
import 'theme_controller_extension.dart';

class AppController extends GetxController {
  static AppController to = Get.find();
  final languageCode = LocalizationService.languages[0].obs;
  final theme = ThemeType.light.obs;
  final prefs = PreferenceManagerImpl();
  late ThemeMode themeMode;

  AppController() {
    getThemeModeFromStore();
  }
}
