import 'package:flutter_getx_base/data/repository/auth_repository_extension.dart';
import 'package:flutter_getx_base/data/repository/repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  RxBool switchValue = false.obs;

  final Repository repository = Get.find();

  void changeValue() {
    switchValue.value = !switchValue.value;
    update();
  }

  void login() async {
    final result =
        await repository.login(email: 'hoa@gmail.com', password: 'Abcd@123');
    print(result);
  }

  void getWeather() async {
    final result = await repository.getWeather();
    print(result);
  }
}
