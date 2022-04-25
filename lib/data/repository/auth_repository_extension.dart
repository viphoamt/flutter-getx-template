import 'package:flutter_getx_base/data/repository/repository.dart';

extension AuthRepositoryExtension on Repository {
  Future<bool> login({required String email, required String password}) async {
    return authService.login(email, password);
  }
}
