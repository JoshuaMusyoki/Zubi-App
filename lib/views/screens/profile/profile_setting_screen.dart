import 'package:flutter/material.dart';
import 'package:zubi/views/screens/profile/app_rating_screen.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Setting"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
                opacity: 0.5,
              child: Image.asset(
                  'assets/images/background_otp.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  children: [
                    _buildListItem(Icons.notifications, 'Notifications', ),
                    _buildListItem(Icons.language, 'Language'),
                    _buildListItem(Icons.share, 'Share profile'),
                    _buildListItem(Icons.block, 'Blocked Users'),
                    _buildListItem(Icons.lock, 'Who can see your post'),
                    _buildListItem(Icons.star, 'Rate'),
                    _buildListItem(Icons.info, 'About us'),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: [
                      _buildGridItem(Icons.facebook, 'Facebook'),
                      _buildGridItem(Icons.messenger, 'WhatsApp'),
                      _buildGridItem(Icons.email, 'Email'),
                      _buildGridItem(Icons.camera, 'Instagram'),
                      _buildGridItem(Icons.cloud, 'Drive'),
                      _buildGridItem(Icons.cloud, 'Drive'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData iconData, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: ListTile(
        leading: Icon(iconData, color: Colors.purple),
        title: Text(label, style: const TextStyle(color: Colors.black)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Handle navigation or actions
          if(label == 'Rate'){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppRatingScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildGridItem(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28.0,
          child: Icon(
            iconData,
            color: Colors.purple,
            size: 28.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        ],
      );
  }
}
