import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_upp/constants.dart';
class QuizCard extends StatelessWidget {
  QuizCard({required this.imgNum,required this.title , required this.btnTitle , required this.color});
  final int imgNum;
  final String title;
  final String btnTitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFE9E9F3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('images/subject$imgNum.jpg'),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$title',style: kWelcomeScreenBodyTextStyle(),),
                Text('12 Questions', style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                        fontSize: 15
                    )
                )),
              ],
            ),
            Spacer(),
            Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text('$btnTitle',style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w500
                    )
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
