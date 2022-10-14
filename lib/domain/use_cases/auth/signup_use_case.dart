import '../../../core/use_cases/use_cases.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class SignUpParams {
  SignUpParams(this.username, this.password);

  final String username;
  final String password;
}

class SignUpByEmailUseCase extends UseCase<User, SignUpParams> {
  SignUpByEmailUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<User> execute(SignUpParams params) {
    return authRepository.signUp(params: params);
  }
}
