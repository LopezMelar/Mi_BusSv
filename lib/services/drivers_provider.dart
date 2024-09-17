import 'package:get/get.dart';

import '../models/driver.dart'; // Asegúrate de tener el modelo Driver en este archivo
import 'environment.dart';

class DriversProvider extends GetConnect {

  String url = Environment.API_URL + 'api/drivers';

  // Método para crear un nuevo conductor
  Future<Response> create(Driver driver) async {
    Response response = await post(
        '$url/create',
        driver.toJson(),
        headers: {'Content-Type': 'application/json'}
    );

    return response;
  }
}
