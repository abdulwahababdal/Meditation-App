import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
      seedColor: MyColors.color5,
    )),
    home: Scaffold(
        body: TipCard(
      tip: Tip(
        text: "text",
        author: "author",
      ),
    )),
  ));
}

class MyColors {
  static const Color color1 = Color(0xFF5D616B);
  static const Color color2 = Color(0xFFCDD3D7);
  static const Color color3 = Color(0xFFE8D8C9);
  static const Color color4 = Color(0xFFFDF2EE);
  static const Color color5 = Color(0xFFE5BABD);
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
