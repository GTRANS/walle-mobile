class Provider {
  int? id;
  String? name;

  Provider({this.id, this.name});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = name;
    return data;
  }
}
