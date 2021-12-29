import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/core/utils/fixture_reader.dart';
import 'package:test_me/features/Home/service/remote_data_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late HomeRemoteDataSourceImplementation homeRemoteDataSourceImplementation;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    homeRemoteDataSourceImplementation =
        new HomeRemoteDataSourceImplementation(client: mockHttpClient);
  });

  group("getMedicalRecords", () {
    test(("should perform a GET request on a URL with application/json header"),
        () {
      when(() => mockHttpClient.get(
            Uri.parse(// cant use any as null exception
                "https://run.mocky.io/v3/30579b01-75f8-4c9f-ac83-c98b5cfe1d2e"),
            headers: any(named: "headers"),
          )).thenAnswer(
        (_) async => http.Response(
            fixtures("features/Home/fixtures/medical_record.json"), 200),
      );

      homeRemoteDataSourceImplementation.getMedicalRecord();

      verify(
        () => mockHttpClient.get(
          Uri.parse(
              "https://run.mocky.io/v3/30579b01-75f8-4c9f-ac83-c98b5cfe1d2e"),
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
    });
  });

  test(("should throw exception error when the error code is 404 or other"),
      () {
    when(() => mockHttpClient.get(
          Uri.parse(
              "https://run.mocky.io/v3/30579b01-75f8-4c9f-ac83-c98b5cfe1d2e"),
          headers: any(named: "headers"),
        )).thenAnswer(
      (_) async => http.Response("Something went wrong", 404),
    );

    final call = homeRemoteDataSourceImplementation.getMedicalRecord;

    expect(call(), throwsA(TypeMatcher<ServerException>()));
  });
}
