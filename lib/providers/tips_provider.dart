import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips.dart';

class TipsProvider extends ChangeNotifier{
  List<Tip> tips = [];
  bool tapped = false;
  Color color = Colors.grey;

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
    int index = tips.indexWhere((tip) => tip.id == newTip.id);
    tips[index] = newTip;
    notifyListeners();
  }

  void deleteTip(int tipId) async {
    await DioClient().deleteTip(tipId: tipId);
    tips.removeWhere((tip) => tip.id == tipId);
    notifyListeners();
  }

  void check() {
    tapped = !tapped;
    color = (tapped) ? Colors.blue : Colors.grey;
    //print(color.toString());
  }

  Color getColor() {
    return color;
  }

  // void addUpVote(int tipId, int userId) {

  //   upvotes.add(userId);
  //   DioClient().updateTip(tip: Tip(text: text, author: author));
  // }

}