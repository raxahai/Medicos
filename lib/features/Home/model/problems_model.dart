import 'package:test_me/features/Home/model/asthma_model.dart';
import 'package:test_me/features/Home/model/diabetes_model.dart';

class Problems {
  List<Diabetes>? diabetes;
  List<Asthma>? asthma;

  Problems({this.diabetes, this.asthma});

  Problems.fromJson(Map<String, dynamic> json) {
    if (json['Diabetes'] != null) {
      diabetes = <Diabetes>[];
      json['Diabetes'].forEach((v) {
        diabetes!.add(new Diabetes.fromJson(v));
      });
    }
    if (json['Asthma'] != null) {
      asthma = <Asthma>[];
      json['Asthma'].forEach((v) {
        asthma!.add(new Asthma.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diabetes != null) {
      data['Diabetes'] = this.diabetes!.map((v) => v.toJson()).toList();
    }
    if (this.asthma != null) {
      data['Asthma'] = this.asthma!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
