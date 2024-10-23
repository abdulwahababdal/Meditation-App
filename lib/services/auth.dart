import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  // final Dio _dio = Dio();

  // final _baseUrl = 'https://coded-pets-api-auth.eapi.joincoded.com';

  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response =
          await Client.dio.post('/signup', data: user.toJson());
      token = response.data["token"];
    } on DioException catch (error) {
      print(error);
    }
    return token;
  }

  Future<String> signin({required User user}) async {
    late String token;
    try {
      Response response =
          await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } on DioException catch (error) {
      print(error);
    }
    return token;
  }
}
