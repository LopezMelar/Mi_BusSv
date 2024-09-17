import 'package:get/get.dart';
import '../models/user.dart';
import 'environment.dart';

class UsersProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    try {
      Response response = await post(
          '$url/create',
          userToJson(user), // Convierte el objeto User a JSON
          headers: {'Content-Type': 'application/json'}
      );

      if (response.hasError) {
        print('Error: ${response.statusText}');
      } else {
        print('Response: ${response.body}');
      }

      return response;
    } catch (e) {
      print('Exception: $e');
      return Response(statusCode: 500, body: 'Internal Server Error');
    }
  }
}
