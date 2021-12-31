import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_me/core/network/connection_checker.dart';
import 'package:test_me/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements ConnectionChecker {}

void main() {
  late NetworkInfoImplementation networkInfoImplementation;
  late MockDataConnectionChecker mockDataConnectionChecker;
  setUp(() {
    mockDataConnectionChecker = new MockDataConnectionChecker();
    networkInfoImplementation =
        new NetworkInfoImplementation(mockDataConnectionChecker);
  });

  test("should forward the call to has DataConnectionChecker.hasConnection",
      () async {
    final testHasConnectionFuture = true;
    when(() => networkInfoImplementation.isConnected)
        .thenAnswer((invocation) async => testHasConnectionFuture);

    final result = await networkInfoImplementation.isConnected;

    verify(() => networkInfoImplementation.isConnected);
    expect(result, testHasConnectionFuture);
  });
}
