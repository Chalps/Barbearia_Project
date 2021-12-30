import 'dart:convert';

class UserModel {
  final String? name;
  final String? email;
  final String? photoURL;

  UserModel({this.name,this.photoURL, this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'],email: map['email'],photoURL: map['photoURL']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "photoURL": photoURL,
  };

  String toJson() => jsonEncode(toMap());
}