import 'package:flutter_getx_base/commons/constant/index.dart';
import 'package:flutter_getx_base/core/controllers/app_controller.dart';
import 'package:flutter_getx_base/localization/localization_service.dart';

import '../../data/models/enum/language_type.dart';

extension LanguageControllerExtension on AppController {
  void getSavedLanguageCode() async {
    final savedLanguageCode = await prefs.getString(AppConstant.language);
    changeLocale(LanguageTypeExtension.parseLanguageCode(savedLanguageCode));
  }

  void changeLocale(LanguageType? value) async {
    if (value != null) {
      languageCode.value = value;
      await prefs.setString(AppConstant.language, value.languageCode);
      LocalizationService.changeLocale(value);
      update();
    }
  }
}
