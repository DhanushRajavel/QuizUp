import 'package:flutter/material.dart';
import 'package:quiz_upp/constants.dart';
class OptionButton extends StatelessWidget {
  const OptionButton({
    required this.color,
    required this.option,
    required this.answer,
    this.onPress,
  });

  final Color color;
  final String option;
  final String answer;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5), // Spacing between buttons
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Add horizontal padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPress,
        child: Row(
          children: [
            Text(
              '$option ',
              style: kWelcomeScreenBodyTextStyle(),
            ),
            Expanded(
              child: Text(
                '$answer',
                overflow: TextOverflow.visible, // Ensure text is visible
                style: kWelcomeScreenBodyTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
