import 'package:test_me/features/Home/model/associated_drug_model.dart';

class ClassName {
  List<AssociatedDrug>? associatedDrug;
  List<AssociatedDrug>? associatedDrug2;

  ClassName({this.associatedDrug, this.associatedDrug2});

  ClassName.fromJson(Map<String, dynamic> json) {
    if (json['associatedDrug'] != null) {
      associatedDrug = <AssociatedDrug>[];
      json['associatedDrug'].forEach((v) {
        associatedDrug!.add(new AssociatedDrug.fromJson(v));
      });
    }
    if (json['associatedDrug#2'] != null) {
      associatedDrug2 = <AssociatedDrug>[];
      json['associatedDrug#2'].forEach((v) {
        associatedDrug2!.add(new AssociatedDrug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.associatedDrug != null) {
      data['associatedDrug'] =
          this.associatedDrug!.map((v) => v.toJson()).toList();
    }
    if (this.associatedDrug2 != null) {
      data['associatedDrug#2'] =
          this.associatedDrug2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
