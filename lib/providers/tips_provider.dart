import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips.dart';

class TipsProvider extends ChangeNotifier{
  List<Tip> tips = [];

  Future<void> getPets() async {
    tips = await DioClient().getTips();
  }

  void createPet(Tip tip) async {
    Tip newTip = await DioClient().createTip(tip: tip);
    tips.insert(0, newTip);
    notifyListeners();
  }

  void updatePet(Tip tip) async {
    Tip newTip = await DioClient().updateTip(tip: tip);
    int index = tips.indexWhere((pet) => pet.id == newTip.id);
    tips[index] = newTip;
    notifyListeners();
  }

  void deletePet(int tipId) async {
    await DioClient().deleteTip(tipId: tipId);
    tips.removeWhere((tip) => tip.id == tipId);
    notifyListeners();
  }
}