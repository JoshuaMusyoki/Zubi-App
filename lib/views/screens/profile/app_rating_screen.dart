import 'package:flutter/material.dart';

class AppRatingScreen extends StatefulWidget {
  const AppRatingScreen({super.key});

  @override
  State<AppRatingScreen> createState() => _AppRatingScreenState();
}

class _AppRatingScreenState extends State<AppRatingScreen> {
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
          Positioned(
              child: Opacity(
                  opacity: 0.5,
                child: Image.asset(
                    "assets/images/background_otp.png",
                  fit: BoxFit.cover,
                ),
              ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    children: [
                      _buildListItem(Icons.notifications, "Notifications"),
                      _buildListItem(Icons.language, "Languages"),
                    ],
                  )
              ),
    _buildSettingsOptions(),
    _buildRatingCard()
            ],
          )
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
        },
      ),
    );
  }

  Widget _buildSettingsOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: [
          _buildListsItem(Icons.notifications, 'Notifications'),
          const SizedBox(height: 16.0),
          _buildListsItem(Icons.language, 'Language'),
        ],
      ),
    );
  }

  Widget _buildRatingCard() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              radius: 40.0,
              child: const Icon(Icons.thumb_up, color: Colors.white, size: 40.0),
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Do you like this App",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Give us your feedback with rating, so we know if you like it",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 24.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 32.0),
                Icon(Icons.star, color: Colors.yellow, size: 32.0),
                Icon(Icons.star, color: Colors.yellow, size: 32.0),
                Icon(Icons.star, color: Colors.yellow, size: 32.0),
                Icon(Icons.star_half, color: Colors.yellow, size: 32.0),
              ],
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onPressed: () {
                // Handle update action
              },
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.purple, fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Handle "Not now" action
              },
              child: const Text(
                "Not now",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListsItem(IconData iconData, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: ListTile(
        leading: Icon(iconData, color: Colors.purple),
        title: Text(label, style: const TextStyle(color: Colors.black)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Handle navigation or actions
        },
      ),
    );
  }
}
