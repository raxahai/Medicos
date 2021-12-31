import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/core/errors/failures.dart';
import 'package:test_me/core/network/connection_checker.dart';
import 'package:test_me/core/network/network_info.dart';
import 'package:test_me/features/Home/model/associated_drug_model.dart';
import 'package:test_me/features/Home/model/medical_record_model.dart';
import 'package:test_me/features/Home/model/problems_model.dart';
import 'package:test_me/features/Home/repository/home_repository.dart';
import 'package:test_me/features/Home/service/remote_data_service.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController {
  HomeRepository homeRepository = HomeRepositoryImpl(
      remoteDataSource: HomeRemoteDataSourceImplementation(
        client: http.Client(),
      ),
      networkInfo: NetworkInfoImplementation(
        ConnectionChecker(
          CustomInternetAddress(),
        ),
      ));

  Rx<bool> isLoading = false.obs;
  AssociatedDrug? associatedDrug;

  @override
  void onInit() {
    getFirstClassNameMedication();
    super.onInit();
  }

  Future<void> getFirstClassNameMedication() async {
    isLoading(true);
    Either<Failure, MedicalRecordModel> call =
        await homeRepository.getMedicalRecord();

    MedicalRecordModel medicalRecordModel = call.fold((l) {
      // implementation will be done
      throw UnimplementedError();
    }, (r) => r);
    List<Problems>? problems = medicalRecordModel.problems;

    // Since list only had one object in each nested json so used
    // so used this technique otherwise have used loop or recursion
    associatedDrug = problems!.first.diabetes!.first.medications!.first
        .medicationsClasses!.first.className!.first.associatedDrug!.first;
    isLoading(false);
  }
}
