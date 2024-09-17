
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/location_service.dart';

class LoginController extends GetxController {


  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController= TextEditingController();
  // Método para limpiar los campos
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }
  void Login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    Get.snackbar('Email', email);
    Get.snackbar('Password', password);

    if (isValidForm(email, password)) {
      Get.snackbar('Formulario valido', 'Estado 200');
      // Navega a la pantalla de servicio de ubicación
      Get.to(() => LocationServiceScreen());
    }
  }






bool isValidForm(String email, String password){
if(!GetUtils.isEmail(email)){
Get.snackbar('Formulario no valido', 'Por favor ingrese un Email valido');
return false;
}

if (email.isEmpty){
  Get.snackbar('Formulario no valido', 'Por favor ingresa un Email');

  return false;
}

if (password.isEmpty){
  Get.snackbar('Formulario no valido', 'Por favor ingresa una contraseña valida');
  return false;
}

return true;

}


  void goToRegisterPage() {
    Get.toNamed('/register');
  }




























}
