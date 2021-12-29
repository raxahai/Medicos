import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataService {
  Future<void> cacheEmail(String email);
}

const String CACHED_EMAIL = "CACHED_EMAIL";

class HomeLocalDataServiceImplementation implements HomeLocalDataService {
  final SharedPreferences sharedPreference;

  HomeLocalDataServiceImplementation({required this.sharedPreference});
  @override
  Future<void> cacheEmail(String email) {
    return sharedPreference.setString(CACHED_EMAIL, email);
  }
}
