import 'package:get/get.dart';

import '../../data/providers/services/auth_service.dart';
import '../../data/repositories_impl/auth_repositories_impl.dart';
import '../../domain/repositories/auth_repository.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoriesImpl(authService: AuthService()),
      fenix: true,
    );
  }
}
