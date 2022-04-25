import 'package:flutter_getx_base/core/controllers/app_controller.dart';
import 'package:flutter_getx_base/localization/localization_service.dart';

extension LanguageControllerExtension on AppController {
  void changeLocale(String? value) {
    if (value != null) {
      languageCode.value = value;
      LocalizationService.changeLocale(value);
      update();
    }
  }
}
