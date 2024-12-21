import 'package:flutter/material.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/quiz_data.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  static final String id = 'result_screen';
  const ResultScreen({super.key, required this.src , required this.questionLength});
  final int src;
  final int questionLength;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/result.jpg')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  src.toString(),
                  style: kQuestionNumberTextStyle().copyWith(fontSize: 25),
                ),
                Text(
                  '/${questionLength*2}',
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              showResult(src,questionLength),
              style: kWelcomeScreenTitleTextStyle().copyWith(fontSize: 45),
            ),
            Text(
              getPerformanceMessage(src, questionLength),
              style: kWelcomeScreenBodyTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
              title: 'Re-Test',
              color: Color(0xFF2100A6),
              onPress: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
