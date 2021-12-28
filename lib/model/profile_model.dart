import 'dart:convert';

class ProfileModel {
  final String email;
  final String? senha;

  ProfileModel({required this.email, this.senha});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(email: map['email'], senha: map['senha']);
  }

  factory ProfileModel.fromJson(String json) =>
      ProfileModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
    "email": email,
    "senha": senha,
  };

  String toJson() => jsonEncode(toMap());
}