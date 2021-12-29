import 'dart:convert';

import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/features/Home/model/medical_record_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<MedicalRecordModel> getMedicalRecord();
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImplementation({required this.client});

  @override
  Future<MedicalRecordModel> getMedicalRecord() async {
    final jsonResponse = await client.get(
        Uri.parse(
            "https://run.mocky.io/v3/30579b01-75f8-4c9f-ac83-c98b5cfe1d2e"),
        headers: {
          "Content-Type": "application/json",
        });
    if (jsonResponse.statusCode == 200) {
      return MedicalRecordModel.fromJson(json.decode(jsonResponse.body));
    } else {
      throw ServerException();
    }
  }
}
