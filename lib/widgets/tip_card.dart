import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';

class TipCard extends StatelessWidget {
  final Tip tip;
  const TipCard({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
          TextFormField(
            readOnly: true,
            maxLines: 3,
            initialValue: "Something",
            decoration: const InputDecoration(
              labelText: "Tip",
              hintText: "something",
              border: OutlineInputBorder()
            ),
            validator: (value) {
              return (value!.isEmpty) ? "fill in the blank" : null;
            },
          ),
        ],
      ),
    );
  }
  
}