import 'package:flutter/material.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/tip_card.dart';
import 'package:provider/provider.dart';

class MytipsPage extends StatelessWidget{
  String author = "Omar";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("My Tips"),),
      body: FutureBuilder(
              future: context.read<TipsProvider>().getTips(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } 
                else if (dataSnapshot.error != null) {
                  return const Center(
                    child: Text('An error occurred'),
                  );
                } 
                else {
                  return //Text("data");
                    Consumer<TipsProvider>(
                      builder: (context, provider, child) =>
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.tips.where((tip) => tip.author == author).toList().length,
                          itemBuilder: (context, index) {
                            //print("creating card");
                            return TipCard(tip: provider.tips.where((tip) => tip.author == author).toList()[index], appear: true,);
                          }
                        )
                    );
                }
              }
            )
    );
  }
}