import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: true);
    String? profilePicturePath = provider.currentUser.profilePicturePath;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF005BAA),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _changeProfilePicture(context, provider);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: profilePicturePath != null &&
                          File(profilePicturePath).existsSync()
                      ? Image.file(
                          File(profilePicturePath),
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        )
                      : const Image(
                          image: AssetImage(
                              "assets/images/profile.jpg"), // Default image
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Full Name: ${provider.currentUser.fullName}",
                        style: const TextStyle(fontSize: 28.0)),
                  ],
                ),
              ),
              Container(finishedExercises)
            ],
          ),
        ),
      ),
    );
  }

  void _changeProfilePicture(
      BuildContext context, UserProvider provider) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      provider.updateProfilePicture(image.path);
    }
  }
}
