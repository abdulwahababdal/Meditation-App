import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips.dart';

class TipsProvider extends ChangeNotifier{
  List<Tip> tips = [];
  bool tapped = false;
  Color color = Colors.grey;
  bool downTapped = false;

  Future<void> getTips() async {
    tips = await DioClient().getTips();
  }

  void createTip(Tip tip) async {
    Tip newTip = await DioClient().createTip(tip: tip);
    tips.add(newTip);
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

  void checkUpvote(Tip tip) {
    tapped = !tapped;
    if (tapped) {
      color = Colors.blue;
      tip.upvotes.add(tip.author.length);
      updateTip(tip);
    }
    else {
      color = Colors.grey;
      tip.upvotes.remove(tip.author.length);
      updateTip(tip);
    }
    //print(color.toString());
  }

  Color getColor() {
    return color;
  }

  void checkDownvote(Tip tip) {
    downTapped = !downTapped;
    if (downTapped) {
      color = Colors.red;
      tip.downvotes.add(tip.author);
      updateTip(tip);
    }
    else {
      color = Colors.grey;
      tip.upvotes.remove(tip.author);
      updateTip(tip);
    }
    //print(color.toString());
  }

  // void addUpVote(int tipId, int userId) {

  //   upvotes.add(userId);
  //   DioClient().updateTip(tip: Tip(text: text, author: author));
  // }

}