import 'package:flutter/material.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:google_fonts/google_fonts.dart';
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

// class ActiveIcon extends StatefulWidget {

//   const ActiveIcon({super.key});
  
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
  
// }

class TipCard extends StatelessWidget {
  final Tip tip;
  const TipCard({super.key, required this.tip});

  //TipsProvider provider = context.watch<TipsProvider>();
  @override
  Widget build(BuildContext context) {
    TipsProvider provider = context.watch<TipsProvider>();
    // TODO: implement build
    return Card(
      child: ListTile(
<<<<<<< HEAD
        title: TextFormField(
          readOnly: true,
          maxLines: 3,
          initialValue: tip.text,
          decoration: const InputDecoration(border: OutlineInputBorder()),
=======
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder()
                  ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                provider.check();
                              });
                            },
                            child: Icon(
                              Icons.thumb_up, 
                              color: provider.getColor(),
                            ),
                          );
                        }
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${tip.upvotes.length}"),
                      )
                    ],
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.thumb_down, color: Colors.red,),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("1"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
>>>>>>> b66622cac2f65d644a89da68bbdd0a464d990dff
        ),
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
