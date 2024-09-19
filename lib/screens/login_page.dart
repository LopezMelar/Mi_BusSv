import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_bussv/services/auth_service.dart';
import '../controllers/login_controller.dart';
import '../services/location_service.dart';
import 'role_selection_screen.dart'; // Importar la pantalla de selección de roles

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  LoginController conlog = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Stack para posicionar elementos uno sobre otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _backButton(context), // Mantén el botón de retroceso independiente
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // Asegura que cubra toda la pantalla
      color: Colors.white, // Cambiado a blanco
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 35, bottom: 40),
      child: const Text(
        'Iniciar Sesion',
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38, fontSize: 20),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Ajusta los márgenes
      child: ElevatedButton(
        onPressed: () {
          conlog.Login();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15), // Ajusta el padding vertical
          backgroundColor: Colors.white, // Fondo blanco para el botón
          side: BorderSide(color: Colors.grey.shade300), // Borde gris
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

  Widget _buttonGoogle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Reducido
      child: ElevatedButton(
        onPressed: () {
          // Implementar la lógica para el inicio de sesión con Google
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            const Text(
              "Iniciar sesión con Google",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonFacebook(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Reducido
      child: ElevatedButton(
        onPressed: () {
          // Implementar la lógica para el inicio de sesión con Facebook
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/facebook.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            const Text(
              "Iniciar sesión con Facebook",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.2, // Ajusta la posición vertical para que sea más alto
      left: 50,
      right: 50,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7, // Aumenta la altura del contenedor
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
              _buttonGoogle(context),
              _buttonFacebook(context), // Agregar el botón de Facebook
              SizedBox(height: 10), // Espacio entre el botón de Google y el texto
              _texDontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _texDontHaveAccount() {
    return Container(
      margin: const EdgeInsets.only(top: 20), // Añadir margen superior para separación
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 7),
          GestureDetector(
            onTap: () => conlog.goToRegisterPage(),
            child: const Text(
              'Crear Cuenta',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
