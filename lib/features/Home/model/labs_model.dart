class Labs {
  String? missingField;

  Labs({this.missingField});

  Labs.fromJson(Map<String, dynamic> json) {
    missingField = json['missing_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['missing_field'] = this.missingField;
    return data;
  }
}
