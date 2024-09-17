
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_bussv/services/auth_service.dart';

import '../services/location_service.dart';
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService(); // Inicializa AuthService

  // Método para limpiar los campos
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  // Método para manejar el inicio de sesión
  void Login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if (isValidForm(email, password)) {
      // Llama al servicio de autenticación
      bool isAuthenticated = await authService.login(email, password);

      if (isAuthenticated) {
        Get.snackbar('Inicio de sesión', 'Autenticación exitosa');
        print('Autenticación exitosa');
        // Navega a la pantalla de servicio de ubicación
        Get.to(() => LocationServiceScreen());
      } else {
        Get.snackbar('Inicio de sesión', 'Credenciales incorrectas');
        print('Credenciales incorrectas');
      }
    }
  }
  bool isValidForm(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no válido', 'Por favor ingrese un Email válido');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingresa un Email');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingresa una contraseña válida');
      return false;
    }

    return true;
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }
}

