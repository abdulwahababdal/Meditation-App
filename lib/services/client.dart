import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://coded-meditation.eapi.joincoded.com'));  //   https://coded-meditation.eapi.joincoded.com
}