import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_upp/components/horizontal_layout.dart';
import 'package:quiz_upp/components/quiz_card.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/components/subject_card.dart';
import 'generate_question_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> questionTitle = ['GK', 'Sci & Nature', 'Sci & Com', 'Animals'];
  List<int> subjectId = [9, 17, 18, 27];
  List<String> subjectName = [
    'GK',
    'Science & Nature',
    'Science & Computer',
    'Animals'
  ];
  Row makeCard() {
    List<Widget> resuableCards = [];
    for (int i = 0; i < subjectId.length; i++) {
      resuableCards.add(
        SubjectCard(
            imageNum: i + 1,
            title: questionTitle[i],
            onTop: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GenerateQuestionScreen(
                          subjectId: subjectId[i],
                          subjectName: subjectName[i])));
            }),
      );
      if( i < subjectId.length-1){
        resuableCards.add(SizedBox(width: 10,));
      }
    }
    return Row(
      children: resuableCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/profile.jpg'),
                      radius: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Dhanush',
                          style: kWelcomeScreenBodyTextStyle(),
                        ),
                        Text(
                          'Ready to Play',
                          style: kWelcomeBodyMsgTextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Color(0xFF2100A6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Play and Win',
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Text(
                          'Start a quiz now and enjoy',
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 4,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 200,
                            height: 40,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Get Started',
                                  style: GoogleFonts.outfit(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                HorizontalLayout(
                  title: 'Categories',
                  buttonTitle: 'View All',
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: makeCard()
                ),
                SizedBox(
                  height: 15,
                ),
                HorizontalLayout(
                  title: 'Recent',
                  buttonTitle: '',
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QuizCard(
                        imgNum: 1,
                        title: 'GK',
                        btnTitle: 'Completed',
                        color: Colors.green),
                    SizedBox(
                      height: 10,
                    ),
                    QuizCard(
                        imgNum: 2,
                        title: 'Science & Nature',
                        btnTitle: 'Incompleted',
                        color: Colors.red),
                    SizedBox(
                      height: 10,
                    ),
                    QuizCard(
                        imgNum: 4,
                        title: 'Animals',
                        btnTitle: 'Incompleted',
                        color: Colors.red),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
