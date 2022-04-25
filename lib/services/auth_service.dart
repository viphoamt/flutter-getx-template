import 'package:flutter_getx_base/network/api_provider.dart';
import 'package:flutter_getx_base/services/endpoint/endpoint.dart';

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
      print(e.toString());
      return false;
    }
  }
}
