import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: TipCard(tip: Tip(text: "text", author: "author"))
      ),
    )
  );
}

class TipCard extends StatelessWidget {
  final Tip tip;
  const TipCard({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: TextFormField(
          readOnly: true,
          maxLines: 3,
          initialValue: tip.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
        trailing: const Icon(Icons.done),
        //subtitle: const Text('This is subtitle'),
        //selected: true,
      ),
    );
  }
  
}