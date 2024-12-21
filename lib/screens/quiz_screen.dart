import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_upp/components/option_button.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/quiz_data.dart';
import 'package:quiz_upp/screens/result_screen.dart';
import 'generate_question_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,
      this.subjectId,
      this.subjectName,
      this.amount,
      this.difficulty,
      this.quizType});
  static final String id = 'quiz_screen';
  final int? subjectId;
  final String? subjectName;
  final String? amount;
  final String? difficulty;
  final String? quizType;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedOption = -1;
  late int subjectId;
  late String subjectName;
  List<QuizData> quizData = [];
  int questionIndex = 0;
  bool showCorrectness = false;
  late String? amount;
  late String? difficulty;
  late String? quizType;
  late int _src = 0;
  late String _showCorrectAnswer;
  late String _showErrorMessage = '';
  @override
  void initState() {
    subjectId = widget.subjectId!;
    subjectName = widget.subjectName!;
    amount = widget.amount;
    difficulty = widget.difficulty;
    quizType = widget.quizType;
    _src = 0;
    getQuestion();
    super.initState();
  }

  void getQuestion() async {
    try {
      var data = await getQuestions(subjectId, amount!, difficulty!, quizType!);
      setState(() {
        quizData = data;
        questionIndex = 0;
      });
    } catch (e) {
      print(e);
    }
  }

  void checkAnswer(int selectedIndex, QuizData quizData) {
    setState(() {
      _selectedOption = selectedIndex;
      showCorrectness = true; // To show the correctness of the selected answer
      _showCorrectAnswer = quizData.correctAnswer;
      if (_selectedOption == quizData.options.indexOf(quizData.correctAnswer)) {
        setState(() {
          _src += 2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: quizData.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GenerateQuestionScreen(subjectId: subjectId,subjectName: subjectName,)));
                            },
                            child: Icon(Icons.arrow_back_ios)),
                        SizedBox(width: 10),
                        Text(
                          '$subjectName',
                          style: GoogleFonts.outfit(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Questions',
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '${questionIndex + 1}',
                                style: kQuestionNumberTextStyle(),
                                children: [
                                  TextSpan(
                                    text: '/${quizData.length}',
                                    style: GoogleFonts.outfit(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Spacer(),
                        // CircularCountDownTimer(
                        //   width: 50,
                        //   height: 50,
                        //   duration: 20,
                        //   fillColor: Colors.grey,
                        //   textStyle: GoogleFonts.outfit(fontSize: 15),
                        //   ringColor: Color(0xFF2100A6),
                        // ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBDEF8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '${quizData[questionIndex].question}',
                          style: kWelcomeScreenBodyTextStyle()
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        children: List.generate(
                          quizData[questionIndex].options.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: OptionButton(
                              onPress: showCorrectness
                                  ? null // Disable buttons after an answer is selected
                                  : () {
                                      checkAnswer(
                                          index, quizData[questionIndex]);
                                    },
                              color: showCorrectness
                                  ? index == _selectedOption
                                      ? _selectedOption ==
                                              quizData[questionIndex]
                                                  .options
                                                  .indexOf(
                                                      quizData[questionIndex]
                                                          .correctAnswer)
                                          ? Color(
                                              0xFF05ed3b) // Green for correct
                                          : Color(0xFFed3b3b) // Red for wrong
                                      : Color(0xFFE9E9F3) // Default
                                  : Color(0xFFE9E9F3),
                              option:
                                  '${String.fromCharCode(97 + index)})', // 'a)', 'b)', etc.
                              answer: quizData[questionIndex].options[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      showCorrectness == true ? _showCorrectAnswer : '',
                      textAlign: TextAlign.center,
                      style: kWelcomeScreenBodyTextStyle().copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    Text(
                      '${showCorrectness == true ? '' : _showErrorMessage}',
                      textAlign: TextAlign.center,
                      style: kWelcomeScreenBodyTextStyle().copyWith(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    RoundedButton(
                        title: 'Next',
                        color: Color(0xFF2100A6),
                        onPress: () {
                          if (_selectedOption == -1) {
                            setState(() {
                              _showErrorMessage = 'Please Select any Option ';
                            });
                          } else if (showCorrectness &&
                              questionIndex < quizData.length - 1) {
                            setState(() {
                              _selectedOption = -1;
                              questionIndex++;
                              showCorrectness = false;
                              _showCorrectAnswer = '';
                              _showErrorMessage = '';
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                          src: _src,
                                          questionLength: quizData.length,
                                        )));
                          }
                        }),
                  ],
                ),
        ),
      ),
    );
  }
}
