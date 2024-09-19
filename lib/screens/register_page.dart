import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {

  RegisterController regcon = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo completamente blanco
      body: Stack(
        children: [
          _boxForm(context),
          _buttonBack(),
        ],
      ),
    );
  }



  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        'Crear Cuenta',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black87,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: regcon.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: regcon.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          prefixIcon: Icon(Icons.perm_identity),
        ),
      ),
    );
  }

  Widget _textFieldTel() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: regcon.telController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.call),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: regcon.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: regcon.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(Icons.password),
        ),
      ),
    );
  }

  Widget _TextFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
      child: TextField(
        controller: regcon.passwordConfirmController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirma contraseña',
          prefixIcon: Icon(Icons.security),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
      child: ElevatedButton(
        onPressed: () => regcon.register(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.white, // Fondo blanco para el botón
          side: BorderSide(color: Colors.grey.shade300), // Borde gris
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido en el botón
          children: [
            Icon(Icons.login, color: Colors.black), // Ícono del login
            SizedBox(width: 10), // Espacio entre el ícono y el texto
            const Text(
              "Registrarse",
              style: TextStyle(color: Colors.black), // Color del texto
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,

          ),
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.22,
        left: 50,
        right: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldEmail(),
            _textFieldTel(),
            _textFieldPassword(),
            _TextFieldConfirmPassword(),
            _buttonRegister(),
          ],
        ),
      ),
    );
  }
}
