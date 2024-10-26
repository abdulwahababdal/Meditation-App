import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class AddtipPage extends StatelessWidget {
  AddtipPage({super.key});
  final _formKey = GlobalKey<FormState>();
  String tip = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add a Tip"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
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
                  onSaved: (newValue) {
                    tip = newValue!;
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(tip);
                      print(context.read<AuthProvider>().user.username);
                      context.read<TipsProvider>().createTip(
                        Tip(
                          text: tip, 
                          author: context.read<AuthProvider>().user.username,
                          upvotes: [],
                          downvotes: []
                        )
                      );
                      GoRouter.of(context).pop();
                    }
                  }, 
                  child: const Text("Submit")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
