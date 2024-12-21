import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_upp/components/call_to_action.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/screens/home_screen.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('images/welcome.jpg'),
                Text(
                  'Sign Up to your Account',
                  style: kWelcomeScreenBodyTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                  kTextFieldStyle.copyWith(hintText: 'Enter your Email'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration:
                  kTextFieldStyle.copyWith(hintText: 'Enter your Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  title: 'Create Account',
                  color: Color(0xFF2100A6),
                  onPress: () async {
                    try {
                      UserCredential newUser =
                      await _auth.createUserWithEmailAndPassword(
                        email: email.toString(),
                        password: password.toString(),
                      );
                      Navigator.pushNamed(context, HomeScreen.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        setState(() {
                          errorMessage = 'The email address is already in use.';
                        });
                      } else {
                        setState(() {
                          errorMessage = 'An error occurred. Please try again.';
                        });
                      }
                    }
                  },
                ),
                if (errorMessage != null) ...[
                  SizedBox(height: 20),
                  Text(
                    errorMessage!,
                    style: kErrorMsgTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
                SizedBox(height: 40),
                CallToAction(
                  title: "I Already have an Account",
                  buttonTitle: 'Login',
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

