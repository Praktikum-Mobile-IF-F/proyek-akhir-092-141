import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/controller/UserController.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/utils/image_picker/ImagePickerHelper.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

late UserModel userData;

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = UserController();
  late String imagePath;
  // File? _image;

  void loadAccInfo() async {
    userData = userController.getUserData(
        SharedPreferenceController.sharedPrefData.getString('email')!);
    imagePath = userData.image;
  }

  @override
  void initState() {
    super.initState();
    loadAccInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        imagePath = await ImagePickerHelper().pickImage();
                        userData.image = imagePath;
                        userController.setUser(SharedPreferenceController.sharedPrefData.getString('email')!, userData);
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundImage: imagePath.isNotEmpty
                            ? FileImage(File(imagePath))
                            : const AssetImage('assets/images/profile.jpg')
                                as ImageProvider,
                        radius: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userData.username,
                            style: const TextStyle(color: Colors.black, fontSize: 20)),
                        const Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green, size: 10),
                            SizedBox(width: 5),
                            Text('Online', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('About Me',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: const Text('username', style: TextStyle(color: Colors.black)),
                  subtitle: Text(userData.username,
                      style: const TextStyle(color: Colors.grey)),
                ),
                ListTile(
                  leading: Icon(Icons.mail, color: Colors.black),
                  title: Text('Email', style: TextStyle(color: Colors.black)),
                  subtitle: Text(userData.email,
                      style: TextStyle(color: Colors.grey)),
                ),
                ListTile(
                  leading: Icon(Icons.games, color: Colors.black),
                  title: Text('Player Name', style: TextStyle(color: Colors.black)),
                  subtitle: Text('${userData.playerName}',
                      style: TextStyle(color: Colors.grey)),
                ),
                ListTile(
                  leading: Icon(Icons.tag, color: Colors.black),
                  title: Text('Tag', style: TextStyle(color: Colors.black)),
                  subtitle: Text('${userData.tag}',
                      style: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton.icon(
                    onPressed: () {
                      SharedPreferenceController.sharedPrefData.remove('login');
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    icon: const Icon(Icons.exit_to_app, color: Colors.white),
                    label: const Text('Log Out', style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
