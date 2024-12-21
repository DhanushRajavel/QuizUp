import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard(
      {required this.imageNum, required this.title, required this.onTop});
  final int imageNum;
  final String title;
  final Function() onTop;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTop,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFFFFEBFF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            // Background image with opacity
            Opacity(
              opacity: 0.8, // Adjust the opacity value
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'images/subject$imageNum.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content (title)
            Center(
              child: Text(
                title,
                style: GoogleFonts.outfit(
                  textStyle:  TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}
