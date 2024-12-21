import 'package:flutter/material.dart';
import 'package:quiz_upp/constants.dart';

class CallToAction extends StatelessWidget {
  const CallToAction(
      {required this.title, required this.buttonTitle, required this.onPress});
  final String? title;
  final String? buttonTitle;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$title",
          style: kCalltoActionTextStyle(),
        ),
        TextButton(
            onPressed: onPress,
            child: Text(
              '$buttonTitle',
              style: kCalltoActionTextStyle(),
            ))
      ],
    );
  }
}
