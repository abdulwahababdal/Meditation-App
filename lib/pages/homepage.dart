import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/tip_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(home: Scaffold(body: Homepage())),
  );
}

class Homepage extends StatelessWidget {
  Homepage({super.key});
  bool isLoged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.today,
                    size: 40,
                  ),
                  Text("Today", textScaler: TextScaler.linear(1.5)),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 40,
                  ),
                  Text("Exercises", textScaler: TextScaler.linear(1.5)),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  Text("Settings", textScaler: TextScaler.linear(1.5)),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push('/add');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: FutureBuilder(
            future: context.read<AuthProvider>().initAuth(),
            builder: (context, snapshot) {
              return Consumer<AuthProvider>(builder: (context, provider, _) {
                return (provider.isAuth())
                    ? ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Text("Welcome ${provider.user.username}"),
                          Image.network(
                            "http://coded-meditation.eapi.joincoded.com/media/1729754471496ku.png",
                            //provider.user.image!,
                            scale: 1.0,
                          ),
                          
                          ListTile(
                            title: const Text("Log out"),
                            trailing: const Icon(Icons.how_to_reg),
                            onTap: () {
                              provider.logout();
                            },
                          )
                        ],
                      )
                    : ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ListTile(
                            title: const Text("Signin"),
                            trailing: const Icon(Icons.login),
                            onTap: () {
                              GoRouter.of(context).push('/signin');
                            },
                          ),
                          ListTile(
                            title: const Text("Signup"),
                            trailing: const Icon(Icons.how_to_reg),
                            onTap: () {
                              GoRouter.of(context).push('/signup');
                            },
                          )
                        ],
                      );
              });
            }),
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
