import 'package:flutter/material.dart';
import 'package:quiz_upp/constants.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({required this.title, required this.color, this.onPress});
  final String? title;
  final Color color;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: color,
      borderRadius: BorderRadius.circular(5),
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 250,
        height: 40,
        
        child: Text('$title',style: kButtonTextStyle(),),
      ),
    );
  }
}
