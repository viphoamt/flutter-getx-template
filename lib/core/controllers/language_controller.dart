import 'package:flutter_getx_base/localization/localization_service.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final languageCode = LocalizationService.languages[0].obs;

  void changeLocale(String? value) {
    if (value != null) {
      languageCode.value = value;
      LocalizationService.changeLocale(value);
      update();
    }
  }
}
