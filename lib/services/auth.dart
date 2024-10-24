import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
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
