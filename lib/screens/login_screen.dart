import 'package:flutter/material.dart';
import 'package:quiz_upp/components/call_to_action.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/screens/home_screen.dart';
import 'package:quiz_upp/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  String? errorMessage;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(image: AssetImage('images/welcome.jpg')),
                Text(
                  'Sign in to your Account',
                  style: kWelcomeScreenBodyTextStyle(),
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
                  title: 'Login',
                  color: Color(0xFF2100A6),
                  onPress: () async {
                    try {
                      UserCredential user =
                          await _auth.signInWithEmailAndPassword(
                              email: email.toString(),
                              password: password.toString());
                      Navigator.pushNamed(context, HomeScreen.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-credential') {
                        setState(() {
                          errorMessage = 'Wrong Credentials';
                        });
                      }
                    } catch (e) {
                      print(e);
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
                SizedBox(height: 40,),
                CallToAction(
                  title: "I Don't have an Account",
                  buttonTitle: 'Create Account',
                  onPress: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
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
