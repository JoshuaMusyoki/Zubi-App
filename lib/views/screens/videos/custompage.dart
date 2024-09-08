import 'package:flutter/material.dart';
import 'package:zubi/constants.dart';
import 'package:zubi/views/screens/auth/login_screen.dart';
import 'package:zubi/views/screens/auth/profile_page.dart';
import 'package:zubi/views/screens/auth/signup_screen.dart';
import 'package:zubi/views/screens/notifications/NotificationPage.dart';
import 'package:zubi/views/screens/videos/search_music_page(2).dart';
import 'package:zubi/views/screens/videos/search_music_page.dart';
import 'package:zubi/views/screens/videos/zubi_add_video_page.dart';
import 'package:zubi/views/widgets/bottom_navigation.dart';

class CustomPageScreen extends StatefulWidget {
  const CustomPageScreen({super.key});

  @override
  State<CustomPageScreen> createState() => _CustomPageScreenState();
}

class _CustomPageScreenState extends State<CustomPageScreen> {
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const CustomPageScreen(),
    const SearchForMusicPage(),
    const ZubiAddNewVideoPage(),
    const Notificationpage(),
    const ProfilePage(),
    LoginScreen(),
    const SignupScreen()
  ];

  // Method to handle onTap navigation
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customHeaderBg,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _currentIndex == 0
          ? Expanded(
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/custom_background.png',
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                const Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    'Narendra Modi-Barak Obama kites to dot Delhi skyline on Independence day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/movie_poster.png',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: const Text(
                            'Bahubali 350 karod paar. bnaya ek aur record',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Row(
                            children: [
                              Icon(Icons.access_time, size: 14),
                              SizedBox(width: 5),
                              Text("9 hrs ago"),
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  '20',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Zubi'),
                            ],
                          ),
                        ),
                      );
                    })),
                    ],
                  ),
          )
          : _pages[_currentIndex], // Display selected page

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTap(2); // Set index to 2 (ZubiAddNewVideoPage)
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
