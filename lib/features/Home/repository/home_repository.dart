import 'package:dartz/dartz.dart';
import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/core/errors/failures.dart';
import 'package:test_me/core/network/network_info.dart';
import 'package:test_me/features/Home/model/medical_record_model.dart';
import 'package:test_me/features/Home/service/remote_data_service.dart';

abstract class HomeRepository {
  Future<Either<Failure, MedicalRecordModel>> getMedicalRecord();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, MedicalRecordModel>> getMedicalRecord() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMedicalRecord = await remoteDataSource.getMedicalRecord();
        return Right(remoteMedicalRecord);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
