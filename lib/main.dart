import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zubi/views/screens/auth/OtpVerification.dart';
import 'package:zubi/views/screens/auth/profile_page.dart';
import 'package:zubi/views/screens/notifications/NotificationPage.dart';
import 'package:zubi/views/screens/splash/language_screen.dart';
import 'package:zubi/views/screens/videos/customized_homepage.dart';
import 'package:zubi/views/screens/videos/custompage.dart';
import 'package:zubi/views/screens/videos/search_music_page.dart';
import 'package:zubi/views/screens/videos/zubi_add_video_page.dart';
import 'package:zubi/views/widgets/bottom_navigation.dart';
import 'firebase_options.dart';
import 'package:zubi/views/screens/auth/login_screen.dart';
import 'package:zubi/views/screens/splash/Splash.dart';
import 'constants.dart';

Future<void> main() async {
  runApp(const ZubiApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}


class ZubiApp extends StatelessWidget {
  const ZubiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Zubi Lite",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // This method will handle page navigation based on the index selected in the Bottom Navigation Bar.
  void _onTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CustomizedHomepage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SearchMusicPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ZubiAddNewVideoPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Notificationpage()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the current page
      body: _getPage(_currentIndex),

      // Floating action button in the center
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Navigate to the Add Content page
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Custom Bottom Navigation Bar from separate file
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap, // Pass the onTap function for navigation
      ),
    );
  }

  // A helper method to return the correct page based on the index
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return CustomizedHomepage();
      case 1:
        return SearchMusicPage();
      case 2:
        return ZubiAddNewVideoPage();
      case 3:
        return Notificationpage();
      case 4:
        return ProfilePage();
      default:
        return CustomPageScreen();
    }
  }
}
