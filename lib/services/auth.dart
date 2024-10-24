import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<String> signup({required String username, password, image}) async {
    late String token;
    try {
      Response response =
          await Client.dio.post('/signup', data: FormData.fromMap({
            "username": username,
            "password": password,
            if (kIsWeb) 
              "image" : "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"
            else 
              "image": await MultipartFile.fromFile(image), 
          })
        );
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

  // Future<String> getImage({required User user}) async {

  // }
}
