import 'package:test_me/features/Home/model/class_name_model.dart';

class MedicationsClasses {
  List<ClassName>? className;
  List<ClassName>? className2;

  MedicationsClasses({this.className, this.className2});

  MedicationsClasses.fromJson(Map<String, dynamic> json) {
    if (json['className'] != null) {
      className = <ClassName>[];
      json['className'].forEach((v) {
        className!.add(new ClassName.fromJson(v));
      });
    }
    if (json['className2'] != null) {
      className2 = <ClassName>[];
      json['className2'].forEach((v) {
        className2!.add(new ClassName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.className != null) {
      data['className'] = this.className!.map((v) => v.toJson()).toList();
    }
    if (this.className2 != null) {
      data['className2'] = this.className2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
