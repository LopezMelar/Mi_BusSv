import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mi_bussv/screens/driver_register_page.dart';
import 'package:mi_bussv/screens/login_page.dart';
import 'package:mi_bussv/screens/open_street_map_screen.dart';
import 'package:mi_bussv/screens/register_page.dart';
import 'package:mi_bussv/screens/welcome_screen.dart';
import 'package:mi_bussv/services/location_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',

      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(), // Cambia la pantalla inicial a WelcomeScreen
      routes: {
        '/location': (context) =>  LocationServiceScreen(),
        '/map': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
          if (args == null || args.length != 2) {
            // Manejo del caso en el que no se pasaron argumentos o los argumentos son inválidos
            return const Scaffold(
              body: Center(
                child: Text('Error: No se recibieron las coordenadas'),
              ),
            );
          }
          final latitude = args[0] as double;
          final longitude = args[1] as double;
          return OpenStreetMapScreen(
            latitude: latitude,
            longitude: longitude,
          );
        },
        '/register': (context) => RegisterPage(), // Añade esta línea
        '/login': (context) => LoginPage(),
        '/register_driver': (context) => DriverRegisterPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
