import 'package:get/get.dart';

import '../models/user.dart';
import 'environment.dart';

class UsersProvider extends GetConnect{

  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post(
        '$url/create',
        user.toJson(),
        headers: {'Content-Type': 'application/json'}
    );

    return response;
  }

}