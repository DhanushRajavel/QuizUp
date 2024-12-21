import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HorizontalLayout extends StatelessWidget {
  HorizontalLayout({required this.title , this.buttonTitle});
  final String title;
  final String? buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title',
          style: GoogleFonts.outfit(
              textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
        ),
        Spacer(),
        Text(
          '$buttonTitle',
          style: GoogleFonts.outfit(
              textStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2100A6),
                  fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}
