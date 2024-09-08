import 'package:flutter/material.dart';

class PostAVideoPage extends StatefulWidget {
  const PostAVideoPage({super.key});

  @override
  State<PostAVideoPage> createState() => _PostAVideoPageState();
}

class _PostAVideoPageState extends State<PostAVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
        ),
        title: const Text("Post Video"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
        //   Background Waves
          Positioned(
            bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_otp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //   Image and Caption Textfield
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //   Video Thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                          'assets/images/post_video.png',
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                  //   Caption Input
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Caption',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          maxLines: 4,
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Save to Gallery Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Save to Gallery",
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.purple,
                    ),
                  ],
                ),
                // Share Post Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Share post",
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.purple,
                    ),
                  ],
                ),
                const Spacer(),
                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/whatsapp_icon.png'), // Add your WhatsApp icon image here
                      iconSize: 50,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset('assets/instagram_icon.png'), // Add your Instagram icon image here
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}