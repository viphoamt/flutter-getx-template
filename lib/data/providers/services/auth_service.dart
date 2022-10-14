import '../network/api_provider.dart';
import 'endpoint/endpoint.dart';

class AuthService {
  ApiProvider apiProvider = ApiProvider();

  Future<bool> login(String email, String password) async {
    try {
      final result = await apiProvider.post(Endpoint.login);
      if (result != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
