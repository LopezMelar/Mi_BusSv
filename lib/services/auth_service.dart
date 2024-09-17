import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<bool> login(String email, String password) async {
    // URL de tu backend para manejar la autenticación
    var url = Uri.parse('http://192.168.1.223:3000/api/login');
    var response = await http.post(url, body: {
      'email': email,
      'password': password
    });

    if (response.statusCode == 200) {
      // Si el servidor responde con éxito
      var data = json.decode(response.body);

      // Supongamos que el servidor devuelve un campo "success" que indica si las credenciales son válidas
      if (data['success']) {
        return true;  // Las credenciales son válidas
      } else {
        return false;  // Las credenciales son incorrectas
      }
    } else {
      return false;  // Error en la solicitud
    }
  }
}
