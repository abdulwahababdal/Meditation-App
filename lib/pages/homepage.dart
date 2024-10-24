import 'package:flutter/material.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/tip_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MaterialApp(home: Scaffold(body: Homepage())),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Today",
                textScaler: TextScaler.linear(1.5),
              )),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Exercises",
                textScaler: TextScaler.linear(1.5),
              )),
        ],
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //TipCard(tip: Tip(text: "text", author: "author")),
            FutureBuilder(
                future: context.read<TipsProvider>().getTips(),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (dataSnapshot.error != null) {
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  } else {
                    return //Text("data");
                        Consumer<TipsProvider>(
                            builder: (context, provider, child) =>
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: provider.tips.length,
                                    itemBuilder: (context, index) {
                                      //print("creating card");
                                      return TipCard(tip: provider.tips[index]);
                                    }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
