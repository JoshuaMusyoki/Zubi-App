import 'package:flutter/material.dart';
import 'package:zubi/views/screens/about/privacy_policy.dart';
import 'package:zubi/views/screens/about/terms_of_service.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                    "assets/images/background_otp.png",
                  fit: BoxFit.cover,
                ),
              )
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    children: [
                      _buildListItem(Icons.policy_outlined, "Privacy Policy"),
                      _buildListItem(Icons.rule, "Terms of Service")
                    ],
                  ),
              ),
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
          if(label == 'Privacy Policy'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()),
            );
          } else if(label == 'Terms of Service'){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsOfService()),
            );
          }
        },
      ),
    );
  }
}
