import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));  //   https://coded-meditation.eapi.joincoded.com
}