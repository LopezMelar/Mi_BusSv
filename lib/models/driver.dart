// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  String? idDriver;
  String? email;
  String? nameDriver;
  String? lastNameDriver;
  String? cellphone;
  String? image;
  String? passwordDriver;
  String? busName;       // Nombre del bus que maneja
  String? plateNumber;    // Número de placa del bus

  Driver({
    this.idDriver,
    this.email,
    this.nameDriver,
    this.lastNameDriver,
    this.cellphone,
    this.image,
    this.passwordDriver,
    this.busName,
    this.plateNumber,
  });

  // Para convertir de JSON a un objeto Driver
  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    idDriver: json["id_driver"],
    email: json["email"],
    nameDriver: json["name_driver"],
    lastNameDriver: json["last_name_driver"],
    cellphone: json["cellphone"],
    image: json["image"],
    passwordDriver: json["password_driver"],
    busName: json["bus_name"],
    plateNumber: json["plate_number"],
  );

  // Para convertir un objeto Driver a JSON
  Map<String, dynamic> toJson() => {
    "id_driver": idDriver,
    "email": email,
    "name_driver": nameDriver,
    "last_name_driver": lastNameDriver,
    "cellphone": cellphone,
    "image": image,
    "password_driver": passwordDriver,
    "bus_name": busName,
    "plate_number": plateNumber,
  };
}
