import 'package:flutter/material.dart';
import 'package:zubi/views/screens/auth/signup_screen.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}): super(key: key);

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
// A set to store selected languages
  final Set<String> _selectedLanguages = {};

  // Language options
  final List<String> languages = [
    'Hindi', 'Gujrati', 'English', 'Marathi', 'Telugu',
    'Malayalam', 'Tamil', 'Punjabi', 'Kannada', 'Bhojpuri',
    'Bengali', 'Haryanvi'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = _selectedLanguages.contains(language);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedLanguages.remove(language);
                        } else {
                          _selectedLanguages.add(language);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.purple : Colors.purple[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          language,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('*Select more than 3 languages'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectedLanguages.length >= 3 ? () {
                //  Navigate to the SignUpPage when "Continue" is pressed
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
