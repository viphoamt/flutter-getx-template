import '../entities/user.dart';
import '../use_cases/auth/login_use_case.dart';
import '../use_cases/auth/signup_use_case.dart';

abstract class AuthRepository {
  Future<bool> login({required LoginParams params});
  Future<bool> loginByGoogle();
  Future<bool> logout();
  Future<User> signUp({required SignUpParams params});
}