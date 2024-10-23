import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/widgets/tip_card.dart';
//import 'models/tip.dart';

void main() {
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});
  String tip = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Tip",
                  hintText: "something",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  return (value!.isEmpty) ? "fill in the blank" : null;
                },
              ),
              Container(margin: const EdgeInsets.all(8.0),),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text("Submit")
              ),
              TipCard(tip: Tip(text: "text", author: "author"))
            ],
          ),
          
        ),
      ),
    );
  }
}
