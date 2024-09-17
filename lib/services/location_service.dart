import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mi_bussv/controllers/login_controller.dart';
import 'package:mi_bussv/screens/open_street_map_screen.dart';

class LocationServiceScreen extends StatelessWidget {
  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation(BuildContext context) async {
    try {
      Position position = await determinePosition();
      Navigator.pushNamed(
        context,
        '/map',
        arguments: [position.latitude, position.longitude],
      );
    } catch (e) {
      // Manejo de errores
      print('Error: $e');
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final bool shouldPop = await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirmación'),
        content: const Text('¿Desea cerrar la sesión y volver al inicio de sesión?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(

            onPressed: () {
              // Limpiar los campos de correo y contraseña
              Get.find<LoginController>().clearFields();
              // Navegar de regreso a la pantalla de inicio de sesión
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Salir'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_map.jpg', // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5), // Efecto borroso
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7), // Fondo opaco
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ubicación en tiempo real',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          getCurrentLocation(context);
                        },
                        child: const Text(
                          'Obtener Ubicación',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                onPressed: () {
                  _onWillPop(context); // Llama a la función para mostrar el diálogo de confirmación
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
