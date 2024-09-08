import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zubi/constants.dart';
import 'package:zubi/views/screens/auth/OtpVerification.dart';
import 'package:zubi/views/screens/auth/signup_screen.dart';
import 'package:zubi/views/screens/splash/language_screen.dart';
import 'package:zubi/views/screens/videos/customized_homepage.dart';
import 'package:zubi/views/screens/videos/custompage.dart';
import 'package:zubi/views/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _verificationId;

  Future<void> _signInWithPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Show an alert dialog or snack bar to inform the user of the failure
          print('Failed to verify phone number: ${e.message}');
          _showErrorDialog('Verification Failed', e.message ?? 'Unknown error occurred.');
        },
        codeSent: (String verificationId, int? resendIdToken) {
          setState(() {
            _verificationId = verificationId;
          });
          // Show the SMS code dialog
          OtpVerificationScreen();
          // _showSmsCodeDialog();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      // Handle any unexpected errors
      print('Error during phone number sign-in: $e');
    }
  }

  void _showSmsCodeDialog() {
    final TextEditingController smsCodeController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter SMS Code'),
          content: TextField(
            controller: smsCodeController,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog before starting sign-in
                await _signInWithSmsCode(smsCodeController.text);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _signInWithSmsCode(String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );

      // Sign in with the credential
      await _auth.signInWithCredential(credential);

      // Navigate to the next page or show success message
    } catch (e) {
      // Handle error during sign-in
      print('Error signing in with SMS code: $e');
      _showErrorDialog('Sign-In Failed', 'The SMS code is incorrect or expired.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<User?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user;
    }
    return null;
  }

  Future<User?> _signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken!.tokenString);
      return (await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential))
          .user;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Sign In",
          style: TextStyle(
            color: buttonColor,
            fontSize:25,
            fontWeight: FontWeight.w900
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: buttonColor,),
          onPressed: (){
              Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
            ),
        child: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/background_image.jpg'), // Background image
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/ZubiLogo.png', // Logo image
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _phoneNumberController,
                  labelText: "Phone Number",
                  hintText: "+1234567890",
                  icon: Icons.phone,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 17.82),
              const Text(
                "* we will send OTP for verification",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 17.82),

              // Verify Phone Number Button
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                // decoration: BoxDecoration(
                //   color: Colors.green,
                //   borderRadius: BorderRadius.circular(5),
                // ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded edges
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: _signInWithPhoneNumber,
                  child: Text(
                    "Verify Phone Number",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // print("login user");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CustomPageScreen()),
                      );
                    },
                    child: const Text("Login",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  ),
                ),
              ),

              SizedBox(height: 16,),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,

                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              // Sign in with Google
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () async {
                    User? user = await _signInWithGoogle();
                    if (user != null) {
                      // Navigate to the next screen or show success message
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Sign in with Facebook
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Sign in with Facebook",
                  onPressed: () async {
                    User? user = await _signInWithFacebook();
                    if (user != null) {
                      // Navigate to the next screen or show success message
                    }
                  },
                ),
              ),

              const SizedBox(height: 17.82),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      // print("navigating user.");
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen())
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
      )
    );
  }
}
