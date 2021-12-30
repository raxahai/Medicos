class Asthma {
  bool? found;

  Asthma({this.found});

  Asthma.fromJson(Map<String, dynamic> json) {
    found = json['found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['found'] = this.found;
    return data;
  }
}
