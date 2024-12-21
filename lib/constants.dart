import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kWelcomeScreenTitleTextStyle(){
  return GoogleFonts.lobster(
    textStyle: TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2100A6),
    )
  );
}
TextStyle kWelcomeScreenBodyTextStyle(){
  return GoogleFonts.outfit(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    )
  );
}

TextStyle kButtonTextStyle(){
  return GoogleFonts.outfit(
    textStyle: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w300
    )
  );
}
TextStyle kQuestionNumberTextStyle(){
  return GoogleFonts.outfit(
      textStyle: TextStyle(
      fontSize: 20,
      color: Colors.pink,
      fontWeight: FontWeight.w500)
  );
}
const kTextFieldStyle = InputDecoration(
  hintText: 'Enter your password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF2100A6), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);

TextStyle kCalltoActionTextStyle(){
  return GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w500
  );
}
TextStyle kWelcomeBodyMsgTextStyle(){
  return GoogleFonts.outfit(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey,
      fontWeight: FontWeight.w300
    )
  );
}

TextStyle kErrorMsgTextStyle(){
  return GoogleFonts.outfit(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.red,
    )
  );
}

TextStyle kDropdownTextStyle(){
  return GoogleFonts.outfit(
    textStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400
    )
  );
}