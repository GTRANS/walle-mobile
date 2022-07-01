class TokenResult {
  String? token;

  TokenResult({this.token});

  TokenResult.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}

class LoginInput {
  String? email;
  String? password;

  LoginInput({this.email, this.password});

  LoginInput.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class RegisterInput {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  int? roleId;

  RegisterInput(
      {this.name, this.email, this.password, this.phoneNumber, this.roleId});

  RegisterInput.fromJson(Map<String, dynamic> json) {
    name = json['nama'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['nomor_handphone'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = name;
    data['email'] = email;
    data['password'] = password;
    data['nomor_handphone'] = phoneNumber;
    data['role_id'] = roleId;
    return data;
  }
}

class VerificationInput {
  String? email;
  String? code;

  VerificationInput({this.email, this.code});

  VerificationInput.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    code = json['kode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['kode'] = code;
    return data;
  }
}

class ResetPasswordRequestInput {
  String? email;
  String? code;
  String? password;

  ResetPasswordRequestInput({this.email, this.code, this.password});

  ResetPasswordRequestInput.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    code = json['kode'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['kode'] = code;
    data['password'] = password;
    return data;
  }
}
