import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_me/features/Login/service/local_data_service.dart';

class MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  late LoginLocalDataServiceImplementation homeLocalDataServiceImplementation;
  late MockSharedPreference mockSharedPreference;

  setUp(() {
    mockSharedPreference = new MockSharedPreference();
    homeLocalDataServiceImplementation =
        new LoginLocalDataServiceImplementation(
            sharedPreference: mockSharedPreference);
  });

  group("CacheEmail", () {
    final String email = "someone@example.com";
    test("should call shared preference to cache the data", () {
      when(() => mockSharedPreference.setString(any(), any()))
          .thenAnswer((invocation) async => true);

      homeLocalDataServiceImplementation.cacheEmail(email);

      verify(() => mockSharedPreference.setString(CACHED_EMAIL, email));
    });
  });
}
