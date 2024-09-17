import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/driver.dart';
import '../services/drivers_provider.dart';

class DriverRegisterController extends GetxController {

  // Controladores de texto para los campos del formulario
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController busNameController = TextEditingController(); // Nombre del bus
  TextEditingController plateNumberController = TextEditingController(); // Número de placa

  DriversProvider driversProvider = DriversProvider();

  void register() async {
    String email = emailController.text.trim();
    String nameDriver = nameController.text.trim();
    String lastNameDriver = lastNameController.text.trim();
    String cellphone = telController.text.trim();
    String passwordDriver = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
    String busName = busNameController.text.trim();
    String plateNumber = plateNumberController.text.trim();

    if (isValidForm(email, nameDriver, lastNameDriver, cellphone, passwordDriver, passwordConfirm, busName, plateNumber)) {
      Driver driver = Driver(
        email: email,
        nameDriver: nameDriver,
        lastNameDriver: lastNameDriver,
        cellphone: cellphone,
        passwordDriver: passwordDriver,
        busName: busName,
        plateNumber: plateNumber,
      );

      Response response = await driversProvider.create(driver);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario correcto', 'Se ha enviado tu solicitud');
    }
  }

  bool isValidForm(String email, String name, String lastName, String tel, String password, String passwordConfirm, String busName, String plateNumber) {
    List<String> validateFields = [email, name, lastName, tel, password, passwordConfirm, busName, plateNumber];

    for (var i = 0; i < validateFields.length; i++) {
      if (validateFields[i].isEmpty) {
        Get.snackbar('Formulario no válido', 'No puedes dejar campos vacíos');
        return false;
      }
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no válido', 'Ingresa un correo válido');
      return false;
    }

    if (password != passwordConfirm) {
      Get.snackbar('Error', 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }
}
