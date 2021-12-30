import 'package:test_me/features/Home/model/problems_model.dart';

class MedicalRecordModel {
  List<Problems>? problems;

  MedicalRecordModel({this.problems});

  MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    if (json['problems'] != null) {
      problems = <Problems>[];
      json['problems'].forEach((v) {
        problems!.add(new Problems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.problems != null) {
      data['problems'] = this.problems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
