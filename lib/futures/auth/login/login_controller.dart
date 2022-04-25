import 'package:flutter_getx_base/data/repository/repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final Repository repository = Get.find();

  void login() async {}

  void getWeather() async {}
}
