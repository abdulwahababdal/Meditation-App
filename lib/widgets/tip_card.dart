import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

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
        upvotes: [],
        downvotes: []
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
  bool appear = false;
  TipCard({super.key, required this.tip});
  //TipsProvider provider = context.watch<TipsProvider>();
  
  @override
  Widget build(BuildContext context) {
    TipsProvider provider = context.watch<TipsProvider>();
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Row(
          children: [
            const Icon(Icons.person),
            Text(tip.author),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              flex: 10,
              child: TextFormField(
                readOnly: true,
                maxLines: 2,
                initialValue: tip.text,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StatefulBuilder(builder: (context, setState) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              provider.checkUpvote(tip);
                            });
                          },
                          child: Icon(
                            Icons.thumb_up,
                            color: provider.color,
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${tip.upvotes.length}"),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                provider.downTapped = !provider.downTapped;
                              });
                            },
                            child: Icon(
                              Icons.thumb_down,
                              color: (provider.downTapped) ? Colors.red : Colors.grey,
                            ),
                          );
                        }
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("${tip.downvotes.length}"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: (appear) ? 
          GestureDetector(
            onTap: () {
              provider.deleteTip(tip.id!);
            },
            child: Icon(Icons.delete, color: Colors.red,)
          ) 
          : null,
        // trailing: const Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Icon(Icons.thumb_up),
        //         Text(" 5")
        //       ],
        //     ),
        //     Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Icon(Icons.thumb_down),
        //         Text(" 1")
        //       ],
        //     ),
        //   ],
        // ),
        //subtitle: const Text('This is subtitle'),
        //selected: true,
      ),
    );
  }
}
