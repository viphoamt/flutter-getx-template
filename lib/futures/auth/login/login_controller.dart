import 'package:get/get.dart';

import '../../../domain/repositories/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final AuthRepository repository = Get.find();

  void login() async {}
}
