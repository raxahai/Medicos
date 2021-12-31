import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/core/errors/failures.dart';
import 'package:test_me/core/network/network_info.dart';
import 'package:test_me/core/utils/fixture_reader.dart';
import 'package:test_me/features/Home/model/medical_record_model.dart';
import 'package:test_me/features/Home/repository/home_repository.dart';
import 'package:test_me/features/Home/service/remote_data_service.dart';

class MockRemoteDataSource extends Mock
    implements HomeRemoteDataSourceImplementation {}

class MockNetworkInfo extends Mock implements NetworkInfoImplementation {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late HomeRepositoryImpl homeRepositoryImpl;

  setUpAll(() {
    mockRemoteDataSource = new MockRemoteDataSource();
    mockNetworkInfo = new MockNetworkInfo();
    homeRepositoryImpl = new HomeRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });

  group("getMedicalRepository:", () {
    final testMedicalRecordModel = MedicalRecordModel.fromJson(
        json.decode(fixtures("features/Home/fixtures/medical_record.json")));

    test("""should return json data from remote data source 
      when successful internet connection """, () async {
      when(() => mockNetworkInfo.isConnected)
          .thenAnswer((invocation) async => true);
      when(() => mockRemoteDataSource.getMedicalRecord())
          .thenAnswer((invocation) async => testMedicalRecordModel);

      final result = await homeRepositoryImpl.getMedicalRecord();

      verify(() => mockNetworkInfo.isConnected);
      verify(() => mockRemoteDataSource.getMedicalRecord());
      expect(result, equals(Right(testMedicalRecordModel)));
    });
    test("should return server failure when remote data source is unsuccesfull",
        () async {
      when(() => mockRemoteDataSource.getMedicalRecord())
          .thenThrow(ServerException());

      final result = await homeRepositoryImpl.getMedicalRecord();

      verify(() => mockRemoteDataSource.getMedicalRecord());
      expect(result, Left(ServerFailure()));
    });
  });
}
