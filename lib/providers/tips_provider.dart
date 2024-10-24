import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips.dart';

class TipsProvider extends ChangeNotifier{
  List<Tip> tips = [];

  Future<void> getTips() async {
    tips = await DioClient().getTips();
  }

  void createTip(Tip tip) async {
    Tip newTip = await DioClient().createTip(tip: tip);
    tips.insert(0, newTip);
    notifyListeners();
  }

  void updateTip(Tip tip) async {
    Tip newTip = await DioClient().updateTip(tip: tip);
    int index = tips.indexWhere((pet) => pet.id == newTip.id);
    tips[index] = newTip;
    notifyListeners();
  }

  void deleteTip(int tipId) async {
    await DioClient().deleteTip(tipId: tipId);
    tips.removeWhere((tip) => tip.id == tipId);
    notifyListeners();
  }
}