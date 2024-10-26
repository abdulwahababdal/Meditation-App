import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: Scaffold(body: MenuPage())),
  );
}

class MenuPage extends StatelessWidget {

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Menu Page"),),
      body: GridView(
        //physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        children: [
          GridTile(
            child: GestureDetector(
              onTap: () {
                
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.tips_and_updates,
                      size: 200,
                    ),
                    Text("Tips", style: TextStyle(fontSize: 100),)
                  ],
                ),
              ),
            )
          ),
          GridTile(
            child: GestureDetector(
              onTap: () {
                
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 200,
                    ),
                    Text("Music", style: TextStyle(fontSize: 100),)
                  ],
                ),
              ),
            )
          ),
          GridTile(
            child: GestureDetector(
              onTap: () {
                
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 200,
                    ),
                    Text("Meditation", style: TextStyle(fontSize: 80),)
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

}