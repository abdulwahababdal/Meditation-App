import 'dart:async';
import "package:dio/dio.dart";
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/client.dart';

class DioClient {
  Future<List<Tip>> getTips() async {
    List<Tip> tips = [];
    try {
      Response response = await Client.dio.get('/tips');
      tips = (response.data as List).map((tip) => Tip.fromJson(tip)).toList();
    } on DioException catch (error) {
      print(error);
    }
    return tips;
  }

  Future<Tip> createTip({required Tip tip}) async {
    late Tip retrievedTip;
    try {
      FormData data = FormData.fromMap({
        "text": tip.text,
        "author": tip.author,
        "upvotes": tip.upvotes,
        "downvotes": tip.downvotes,//await MultipartFile.fromFile(
          //Tip.image,
        //),
      });
      Response response = await Client.dio.post('/tips', data: data);
      retrievedTip = Tip.fromJson(response.data);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedTip;
  }

  Future<Tip> updateTip({required Tip tip}) async {
    late Tip retrievedTip;
    try {
      FormData data = FormData.fromMap({
        "text": tip.text,
        "author": tip.author,
        "upvotes": tip.upvotes,
        "downvotes": tip.downvotes,//await MultipartFile.fromFile(
          //Tip.image,
        //),
      });
      Response response = await Client.dio.put('/Tips/${tip.id}', data: data);
      retrievedTip = Tip.fromJson(response.data);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedTip;
  }

  Future<void> deleteTip({required int tipId}) async {
    try {
      await Client.dio.delete('/Tips/$tipId');
    } on DioException catch (error) {
      print(error);
    }
  }
}
