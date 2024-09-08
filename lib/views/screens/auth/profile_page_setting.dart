import 'package:flutter/material.dart';
import 'package:zubi/views/screens/notifications/notifications_settings_screen.dart';

class ProfilePageSetting extends StatefulWidget {
  const ProfilePageSetting({super.key});

  @override
  State<ProfilePageSetting> createState() => _ProfilePageSettingState();
}

class _ProfilePageSettingState extends State<ProfilePageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Setting"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_otp.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildProfileHeader(),
          _buildSettingsOption(
            icon: Icons.edit,
            title: "Edit Profile",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.notifications,
            title: "Notifications",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsSettingsScreen()),
              );
            },
          ),
          _buildSettingsOption(
            icon: Icons.language,
            title: "Language",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.share,
            title: "Share Profile",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.block,
            title: "Blocked Users",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.visibility,
            title: "Who can see your post",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.star,
            title: "Rate",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.info,
            title: "About Us",
            onTap: () {},
          ),
          _buildSettingsOption(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {},
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }

  // Build profile header widget
  Widget _buildProfileHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
                'assets/images/profile_placeholder.png'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.purple,
                child: Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terry Migua",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Demo@gmail.com",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Build individual settings options
  Widget _buildSettingsOption(
      {required IconData icon,
      required String title,
      required VoidCallback onTap,
      Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.purple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
