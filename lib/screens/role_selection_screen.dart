import 'package:flutter/material.dart';
import 'package:mi_bussv/screens/login_bus.dart';
import 'login_page.dart'; // Pantalla de usuario

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF50057), // Color azul claro
              Color(0xFFE0F7FA), // Color azul más claro
            ],
            stops: [0.10, 0.90], // Ajuste para evitar la línea blanca
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 400, // Modificar altura si es necesario
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Fondo blanco opaco
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Sombras
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Texto "Seleccionar Rol"
                const Text(
                  'Seleccionar Rol',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Puedes cambiar el color si lo prefieres
                  ),
                ),
                const SizedBox(height: 20), // Espacio entre el título y el logo
                // Logo o imagen
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/images/dedo.png', // Ruta de tu logo
                    width: 100,
                    height: 100,
                  ),
                ),
                // Botón "Soy Usuario"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(), // Pantalla de usuario
                      ),
                    );
                  },
                  child: const Text('USER'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Color del botón
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white, // Color del texto
                  ),
                ),
                const SizedBox(height: 40), // Espacio entre botones
                // Botón "Soy Autobús"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginBus(), // Pantalla de autobuses
                      ),
                    );
                  },
                  child: const Text('DRIVER'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Color del botón
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white, // Color del texto
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
