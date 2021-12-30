import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_me/features/Login/repository/login_repository.dart';
import 'package:test_me/features/Login/service/local_data_service.dart';

class MockLocalDataSource extends Mock implements LoginLocalDataService {}

void main() {
  late LoginRepositoryImpl loginRepositoryImpl;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = new MockLocalDataSource();
    loginRepositoryImpl =
        new LoginRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  group("Login", () {
    final cacheEmail = "someone@gmail.com";
    test("should check whether email is cached on login", () async {
      when(() => mockLocalDataSource.cacheEmail(any()))
          .thenAnswer((invocation) async => true);

      final result = await loginRepositoryImpl.login(cacheEmail);

      verify(() => mockLocalDataSource.cacheEmail(cacheEmail));
      expect(result, true);
    });

    test("should check whether email is not cached on login", () async {
      when(() => mockLocalDataSource.cacheEmail(any()))
          .thenAnswer((invocation) async => false);

      final result = await loginRepositoryImpl.login(cacheEmail);

      verify(() => mockLocalDataSource.cacheEmail(cacheEmail));
      expect(result, false);
    });
  });
}
