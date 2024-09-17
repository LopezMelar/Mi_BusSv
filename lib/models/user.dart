// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? idUser;
  String? email;
  String? nameUser;
  String? lastNameUser;
  String? cellphone;
  String? image;
  String? passwordUser;

  User({
    this.idUser,
    this.email,
    this.nameUser,
    this.lastNameUser,
    this.cellphone,
    this.image,
    this.passwordUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["id_user"],
    email: json["email"],
    nameUser: json["name_user"],
    lastNameUser: json["last_name_user"],
    cellphone: json["cellphone"],
    image: json["image"],
    passwordUser: json["password_user"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "email": email,
    "name_user": nameUser,
    "last_name_user": lastNameUser,
    "cellphone": cellphone,
    "image": image,
    "password_user": passwordUser,
  };
}
