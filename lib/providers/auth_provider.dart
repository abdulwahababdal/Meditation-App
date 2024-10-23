import 'dart:io';

import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/auth.dart';
import 'package:adopt_app/services/client.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;

  void signup({required User user}) async {
    token = await AuthServices().signup(user: user);
    _setToken(token);
    //print(token);
    notifyListeners();
  }

  void signin({required User user}) async {
    token = await AuthServices().signin(user: user);
    _setToken(token);
    //print(token);
    notifyListeners();
  }

  bool isAuth() {
    return (token.isNotEmpty && !Jwt.isExpired(token)); 
  }

  Future<void> initAuth() async {
    await _getToken();
    if (isAuth()) {
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      print('Bearer $token');
      notifyListeners();
    }
  }
  void _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    notifyListeners();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    token = "";
    notifyListeners();
  }
}
