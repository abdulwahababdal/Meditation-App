import 'package:flutter/material.dart';

class AddtipPage extends StatelessWidget {
  const AddtipPage({super.key});
  //String tip = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add a Tip"),
        ),
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
                    border: OutlineInputBorder()),
                validator: (value) {
                  return (value!.isEmpty) ? "fill in the blank" : null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
