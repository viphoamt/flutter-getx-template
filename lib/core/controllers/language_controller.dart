import 'package:flutter_getx_base/commons/langs/localization_service.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final languageCode = 'English'.obs;

  LanguageController(){
    // languageCode.value = LocalizationService.locale?.languageCode ?? '';
  }

  void changeLocale(String? value) {
    print('$value');
    if (value != null) {
      languageCode.value = value;
      LocalizationService.changeLocale(value);
      update();
    }
  }
}
