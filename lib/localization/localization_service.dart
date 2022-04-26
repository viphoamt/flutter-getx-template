import 'dart:ui';
import 'package:flutter_getx_base/localization/vn_vi.dart';
import 'package:flutter_getx_base/models/enum/language_type.dart';
import 'package:get/get.dart';
import 'en_us.dart';

class LocalizationService extends Translations {
  // Default locale
  static const Locale locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const Locale fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final List<LanguageType> languages = <LanguageType>[
    LanguageType.english,
    LanguageType.vietnamese
  ];

  // Supported locales
  // Needs to be same order with languages
  static final List<Locale> locales = <Locale>[
    const Locale('en', 'US'),
    const Locale('vn', 'VI'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': enUS, // lang/en_us.dart
        'vn_vi': vnVI,
      };

  // Gets locale from language, and updates the locale
  static void changeLocale(LanguageType lang) {
    final Locale? locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(LanguageType lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }
}
