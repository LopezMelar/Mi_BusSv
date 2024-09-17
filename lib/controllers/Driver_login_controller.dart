import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/location_service.dart';

class DriverLoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email del conductor: $email');
    print('Contraseña del conductor: $password');

    Get.snackbar('Email', email);
    Get.snackbar('Password', password);

    if (isValidForm(email, password)) {
      Get.snackbar('Formulario válido', 'Estado 200');
      Get.snackbar('Formulario válido', 'Estado 200');
      Get.to(() => LocationServiceScreen());
    }
  }

  bool isValidForm(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no válido', 'Por favor ingrese un email válido');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingresa un email');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingresa una contraseña válida');
      return false;
    }

    return true;
  }


 void goToRegisterPageBus() {

   Get.toNamed('/register_driver'); // Redirige a la página de registro de conductores

 }


}
