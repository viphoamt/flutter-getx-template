import 'dart:collection';
import 'dart:ui';

import 'package:flutter_getx_base/commons/langs/en_US.dart';
import 'package:flutter_getx_base/commons/langs/vi_VN.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // locale will be get each when new open app (sub Belongs to the locale system or you can cache the locale that the user has installed and put it here)
  static final locale = _getLocaleFromLanguage();

  // fallbackLocale is the default locale if the locale set is not in the Locale support
  static final fallbackLocale = Locale('en', 'US');

  // language code of supported locales
  static final langCodes = [
    'en',
    'vi',
  ];

  // Locales are supported
  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  // Map of supported languages comes with that lang's code: this is used to dump data into the DropdownButton and set the language without caring about the system's language.
  static final langs = Map<String, String>.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  // function change language if you don't want to depend on system locale
  static void changeLocale(String? langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    final lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}
