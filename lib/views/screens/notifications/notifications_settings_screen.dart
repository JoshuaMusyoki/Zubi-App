import 'package:flutter/material.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool followEnabled = true;
  bool likesEnabled = true;
  bool commentsEnabled = true;
  bool shareItemsEnabled = true;
  bool updatesEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Notifications', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_otp.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                buildNotificationSwitch(
                  title: "Follow",
                  value: followEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      followEnabled = value;
                    });
                  },
                ),
                buildNotificationSwitch(
                  title: "Likes",
                  value: likesEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      likesEnabled = value;
                    });
                  },
                ),
                buildNotificationSwitch(
                  title: "Comments",
                  value: commentsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      commentsEnabled = value;
                    });
                  },
                ),
                buildNotificationSwitch(
                  title: "Share items",
                  value: shareItemsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      shareItemsEnabled = value;
                    });
                  },
                ),
                buildNotificationSwitch(
                  title: "Update from the people you follow",
                  value: updatesEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      updatesEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          // Optional: Add the wavy pattern as a footer here
          Container(
            height: 100, // Adjust height as necessary
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB3F1FE), // Top gradient color
                  Color(0xFFD4C1FF), // Bottom gradient color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationSwitch({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}