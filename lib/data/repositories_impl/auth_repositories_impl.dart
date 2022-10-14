import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/auth/login_use_case.dart';
import '../../domain/use_cases/auth/signup_use_case.dart';
import '../providers/services/auth_service.dart';

class AuthRepositoriesImpl extends AuthRepository {
  AuthRepositoriesImpl({required this.authService});

  final AuthService authService;

  @override
  Future<bool> login({required LoginParams params}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> loginByGoogle() {
    // TODO: implement loginByGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({required SignUpParams params}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
