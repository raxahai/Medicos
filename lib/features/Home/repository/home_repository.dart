import 'package:dartz/dartz.dart';
import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/core/errors/failures.dart';
import 'package:test_me/features/Home/model/medical_record_model.dart';
import 'package:test_me/features/Home/service/remote_data_service.dart';

abstract class HomeRepository {
  Future<Either<Failure, MedicalRecordModel>> getMedicalRecord();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, MedicalRecordModel>> getMedicalRecord() async {
    try {
      final remoteMedicalRecord = await remoteDataSource.getMedicalRecord();
      return Right(remoteMedicalRecord);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
