import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_bussv/controllers/Driver_login_controller.dart';

import 'role_selection_screen.dart'; // Importar la pantalla de selección de roles

class LoginBus extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  DriverLoginController conlog = Get.put(DriverLoginController()); // Asegúrate de usar DriverLoginController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _texDontHaveAccount(),
      ),
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: 0,
            right: 0,
            child: Column(
              children: [
                _imageCover(),
                _textAppName(),
              ],
            ),
          ),
          _backButton(context),
        ],
      ),
    );
  }
  Widget _backgroundCover(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.cyanAccent,
    );
  }

  Widget _textAppName() {
    return const Text(
      "DRIVER",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: Colors.black38),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 35, bottom: 40),
      child: const Text(
        'Ingrese sus datos',
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38, fontSize: 20),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: conlog.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'correo electronico',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: conlog.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'contraseña',
          prefixIcon: Icon(Icons.password),
        ),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
      child: ElevatedButton(
        onPressed: () {
          conlog.login();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido en el botón
          children: [
            Icon(Icons.login, color: Colors.black), // Ícono del login
            SizedBox(width: 10), // Espacio entre el ícono y el texto
            const Text(
              "Login",
              style: TextStyle(color: Colors.black), // Color del texto
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.33,
        left: 50,
        right: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const <BoxShadow>[
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
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _texDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('¿No tienes una cuenta?', style: TextStyle(color: Colors.black)),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => conlog.goToRegisterPageBus(),
          child: const Text(
            'Registrate aqui',
            style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Widget para el logo
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/images/autobus.png', // Reemplaza con la ruta de tu logo
          width: 130,
          height: 130,
        ),
      ),
    );
  }

  // Widget para el botón de retroceso
  Widget _backButton(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Regresa a la pantalla de selección de roles
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
            );
          },
        ),
      ),
    );
  }
}
