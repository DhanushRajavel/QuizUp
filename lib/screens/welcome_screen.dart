import 'package:flutter/material.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/welcome.jpg')),
            Text(
              'Quiz Up!',
              style: kWelcomeScreenTitleTextStyle(),
            ),
            Text(
              'Test your knowledge with a variety of quizzes. '
              'Challenge yourself, earn points, and see how you rank!',
              style: kWelcomeScreenBodyTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
              title: 'Get Started',
              color: Color(0xFF2100A6),
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
