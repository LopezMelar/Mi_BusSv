import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/users_provider.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String email = emailController.text.trim();
    String nameUser = nameController.text.trim();
    String lastNameUser = lastNameController.text.trim();
    String cellphone = telController.text.trim();
    String passwordUser = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if (isValidForm(email, nameUser, lastNameUser, cellphone, passwordUser, passwordConfirm)) {
      User user = User(
        email: email,
        nameUser: nameUser,
        lastNameUser: lastNameUser,
        cellphone: cellphone,
        passwordUser: passwordUser,
      );

      Response response = await usersProvider.create(user);

      if (response.statusCode == 201) {
        Get.snackbar('Formulario correcto', 'Se ha enviado tu solicitud');
      } else {
        Get.snackbar('Error', 'Error al registrar: ${response.body}');
      }
    }
  }

  bool isValidForm(String email, String name, String lastName, String tel, String password, String passwordConfirm) {
    List<String> validateFields = [email, name, lastName, tel, password, passwordConfirm];

    for (var i = 0; i < validateFields.length; i++) {
      if (validateFields[i].isEmpty) {
        Get.snackbar('Formulario no válido', 'No puedes dejar campos vacíos');
        return false;
      }
    }

    if (!GetUtils.isEmail(validateFields[0])) {
      Get.snackbar('Formulario no válido', 'Ingresa un correo válido');
      return false;
    }

    if (validateFields[4] != validateFields[5]) {
      Get.snackbar('Error', 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }
}
