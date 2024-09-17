import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/driver_register_controller.dart';

class DriverRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DriverRegisterController controller = Get.put(DriverRegisterController());

    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context, controller),
          _imageUser(),
          _buttonBack()
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.cyanAccent,
    );
  }

  Widget _imageUser() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Container(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset('assets/images/useradd.png', fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        'Crea tu cuenta ahora!',
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38, fontSize: 20),
      ),
    );
  }

  Widget _textFieldName(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldLastName(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          prefixIcon: Icon(Icons.perm_identity),
        ),
      ),
    );
  }

  Widget _textFieldTel(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.call),
        ),
      ),
    );
  }

  Widget _textFieldEmail(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldPassword(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirma tu contraseña',
          prefixIcon: Icon(Icons.lock_outline),
        ),
      ),
    );
  }

  Widget _textFieldBusName(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Ruta del Bus',
          prefixIcon: Icon(Icons.directions_bus),
        ),
      ),
    );
  }

  Widget _textFieldPlateNumber(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Número de Placa',
          prefixIcon: Icon(Icons.pin),
        ),
      ),
    );
  }

  Widget _buttonRegister(DriverRegisterController controller) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
      child: ElevatedButton(
        onPressed: () => controller.register(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.purple, // Color del botón
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido en el botón
          children: [
            Icon(Icons.directions_bus, color: Colors.white), // Ícono del bus
            SizedBox(width: 10), // Espacio entre el ícono y el texto
            Text(
              'Registrarse',
              style: TextStyle(color: Colors.white),
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
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context, DriverRegisterController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22, left: 50, right: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldName(controller.nameController),
            _textFieldLastName(controller.lastNameController),
            _textFieldEmail(controller.emailController),
            _textFieldTel(controller.telController),
            _textFieldPassword(controller.passwordController),
            _textFieldConfirmPassword(controller.passwordConfirmController),
            _textFieldBusName(controller.busNameController),
            _textFieldPlateNumber(controller.plateNumberController),
            _buttonRegister(controller),
          ],
        ),
      ),
    );
  }
}
