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

  Future<bool> getWeather() async {
    try {
      final query = {
        'access_key': '77a16f4a94779bd6c3652b84df2108e1',
        'query': 'hanoi'
      };
      final result = await apiProvider.get(
        '/current',
        params: query,
      );
      if (result != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
