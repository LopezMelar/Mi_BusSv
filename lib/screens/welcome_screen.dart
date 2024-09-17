import 'package:flutter/material.dart';
import 'package:mi_bussv/screens/role_selection_screen.dart'; // Importa la pantalla de selección de rol

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isHelloVisible = true;
  bool _isLoadingVisible = false;

  @override
  void initState() {
    super.initState();

    // "¡Hola!" aparece por 1 segundo
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isHelloVisible = false;
        _isLoadingVisible = true; // Mostrar "Cargando perfiles disponibles"
      });
    });

    // El mensaje de "Cargando perfiles disponibles" desaparece después de 2 segundos
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoadingVisible = false;
      });
    });

    // Navegar a la pantalla de selección de rol después de 3 segundos (1 segundo de "¡Hola!" + 2 segundos de "Cargando")
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RoleSelectionScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mensaje "¡Hola!"
            AnimatedOpacity(
              opacity: _isHelloVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                '¡Hola!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20), // Espacio entre los textos

            // Mensaje "Cargando perfiles disponibles"
            AnimatedOpacity(
              opacity: _isLoadingVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Cargando perfiles disponibles...',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
