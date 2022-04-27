import 'package:flutter_getx_base/data/repository/repository.dart';
import 'package:flutter_getx_base/services/auth_service.dart';
import 'package:get/get.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Repository>(
      () => Repository(authService: AuthService()),
      fenix: true,
    );
  }
}
