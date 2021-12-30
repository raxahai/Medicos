class AssociatedDrug {
  String? name;
  String? dose;
  String? strength;

  AssociatedDrug({this.name, this.dose, this.strength});

  AssociatedDrug.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dose = json['dose'];
    strength = json['strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dose'] = this.dose;
    data['strength'] = this.strength;
    return data;
  }
}
