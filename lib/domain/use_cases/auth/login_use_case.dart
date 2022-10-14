import '../../../core/use_cases/use_cases.dart';
import '../../repositories/auth_repository.dart';

class LoginParams {
  LoginParams(this.username, this.password);

  final String username;
  final String password;
}

class LoginByEmailUseCase extends UseCase<bool, LoginParams> {
  LoginByEmailUseCase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<bool> execute(LoginParams params) {
    return authRepository.login(params: params);
  }
}

class LoginByGoogleUseCase extends NoParamUseCase<bool> {
  LoginByGoogleUseCase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<bool> execute() {
    return authRepository.loginByGoogle();
  }
}