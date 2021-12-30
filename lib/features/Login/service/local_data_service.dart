import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataService {
  Future<bool> cacheEmail(String email);
}

const String CACHED_EMAIL = "CACHED_EMAIL";

class LoginLocalDataServiceImplementation implements LoginLocalDataService {
  final SharedPreferences sharedPreference;

  LoginLocalDataServiceImplementation({required this.sharedPreference});
  @override
  Future<bool> cacheEmail(String email) {
    return sharedPreference.setString(CACHED_EMAIL, email);
  }
}
