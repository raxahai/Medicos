import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_me/features/Home/service/local_data_service.dart';

class MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  late HomeLocalDataServiceImplementation homeLocalDataServiceImplementation;
  late MockSharedPreference mockSharedPreference;

  setUp(() {
    mockSharedPreference = new MockSharedPreference();
    homeLocalDataServiceImplementation = new HomeLocalDataServiceImplementation(
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
