class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;

  User({this.id, this.name, this.email, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama'];
    email = json['email'];
    phoneNumber = json['nomor_handphone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = name;
    data['email'] = email;
    data['nomor_handphone'] = phoneNumber;
    return data;
  }
}
