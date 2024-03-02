import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
const key = 'token';

class TokenService {
  static Future<void> setToken(String token) async {
    storage.write(key: key, value: token);
  }

  static Future<String> getToken() async {
    String? token = await storage.read(key: key);
    return token ?? '';
  }

  static Future<void> deleteToken() async {
    storage.deleteAll();
  }

  static Future<bool> isTokenValid() async {
    String token = await getToken();
    if (token.isEmpty) {
      return false;
    }
    return true;
  }
}
