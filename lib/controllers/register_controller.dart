import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/users_provider.dart';

class RegisterController extends GetxController{
  
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController= TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController telController= TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController= TextEditingController();


    UsersProvider usersProvider = UsersProvider();

    void register() async{

      String email = emailController.text.trim();
      String nameUser = nameController.text.trim();
      String lastNameUser = lastNameController.text.trim();
      String cellphone = telController.text.trim();
      String passwordUser = passwordController.text.trim();
      String passwordConfirm = passwordConfirmController.text.trim();

      if(isValidForm(email, nameUser, lastNameUser, cellphone, passwordUser, passwordConfirm)){

        User user = User(
          email: email,
           nameUser: nameUser, 
           lastNameUser: lastNameUser, 
           cellphone: cellphone,
           passwordUser: passwordUser,
           );

           Response response = await usersProvider.create(user);

           print('RESPONSE: ${response.body}' );

        Get.snackbar('Formulario correcto', 'Se ha enviado tu solicitud');
      }




    }

bool isValidForm(String email, String name, String lastName, String tel, String password, String passwordConfirm) {
  List<String> validatefields = [email, name, lastName, tel, password, passwordConfirm];

  for (var i = 0; i < validatefields.length; i++) { 
    if (validatefields[i].isEmpty) { 
      Get.snackbar('Formulario no válido', 'No puedes dejar campos vacíos');
      return false;
    }

    if(!GetUtils.isEmail(validatefields[0])){
      Get.snackbar('Formulario no valido', 'ingresa un correo valido');
      return false;
    }

    if(validatefields[4] != validatefields[5]){
      Get.snackbar('Error', 'Las contraseñas no coinciden');
    return false;
    }
  }
  
  return true;
}


}

