//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditation_app/providers/users_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MaterialApp(home: Scaffold(body: Profile())),
  );
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<UsersProvider>(context, listen: true);
    //String? profilePicturePath;//provider.currentUser.profilePicturePath;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 205, 154, 255),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //_changeProfilePicture(context, provider);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue[200]),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[800],
                      size: 200,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Tap to change profile picture",
                style: TextStyle(color: Colors.black54),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Full Name: name", style: TextStyle(fontSize: 28.0)),
                  ],
                ),
              ),
              //Container(finishedExercises)
            ],
          ),
        ),
      ),
    );
  }

  void _changeProfilePicture(
      BuildContext context, UsersProvider provider) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      //provider.updateProfilePicture(image.path);
    }
  }
}
