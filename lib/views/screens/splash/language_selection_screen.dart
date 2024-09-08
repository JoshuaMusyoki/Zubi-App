import 'package:flutter/material.dart';
import 'package:zubi/views/screens/videos/custompage.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  final List<String> _languages = [
    'English',
    'Hindi',
    'Indonesian',
    'Chinese',
    'Arabic',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languages"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: Column(
        children:<Widget> [
          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  title: Text(_languages[index]),
                  value: _languages[index],
                  groupValue: _selectedLanguage,
                  activeColor: Colors.purple, // Customize the color of the radio button
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Reaction of the button when clicked
                  print('Language updated to $_selectedLanguage');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CustomPageScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Button background color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
