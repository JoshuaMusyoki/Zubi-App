import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:zubi/constants.dart';
import 'package:zubi/views/screens/auth/GoogleSignInScreen.dart';
import 'package:zubi/views/screens/auth/login_screen.dart';
import 'package:zubi/views/screens/videos/custompage.dart';

import 'package:zubi/views/widgets/text_input_field.dart';

import '../videos/customized_homepage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
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
                    controller: _fullNameController,
                    labelText: "Enter Your Name",
                    hintText: "John Doe",
                    icon: Icons.person,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: "Enter Your Email Id",
                  hintText: "johndoe@gmail.com",
                  icon: Icons.email,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
          
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _phoneNumberController,
                  labelText: "Enter Your Phone number",
                  hintText: "+255799899566",
                  icon: Icons.phone,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: "Enter Password",
                  hintText: "",
                  isObsecure: true,
                  icon: Icons.lock,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 16),
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
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text("Register",
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
                  text: "Sign Up with Google",
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoogleSignInScreen())
                    );
                  },
                ),
              ),

              SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SignInButton(
                    Buttons.Facebook,
                    text: "Sign up With Facebook",
                    onPressed: (){
                    }
                ),
              )
            ],

          ),

        ),

        ),
      );
  }
}
