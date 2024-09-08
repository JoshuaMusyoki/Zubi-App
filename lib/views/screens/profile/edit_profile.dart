import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  PickedFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile as PickedFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture section
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? const AssetImage('assets/images/profile.png')
                      : FileImage(File(_image!.path)) as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: const CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 20,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Name Input
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
                hintText: "Enter your name",
              ),
            ),
            const SizedBox(height: 16),

            // Email Input
            const TextField(
              decoration: InputDecoration(
                labelText: "Email id",
                border: OutlineInputBorder(),
                hintText: "Enter your email",
              ),
            ),
            const SizedBox(height: 16),

            // Mobile Input
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Mobile number",
                border: OutlineInputBorder(),
                hintText: "Enter your mobile number",
              ),
            ),
            const SizedBox(height: 16),

            // Bio Input
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Bio",
                border: OutlineInputBorder(),
                hintText: "Enter your bio",
              ),
            ),
            const SizedBox(height: 30),

            // Update Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle update action here
                  print("Profile Updated");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Button background color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: EditProfilePage()));
}

