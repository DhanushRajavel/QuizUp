import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_upp/components/rounded_button.dart';
import 'package:quiz_upp/constants.dart';
import 'package:quiz_upp/screens/quiz_screen.dart';
import 'home_screen.dart';

class GenerateQuestionScreen extends StatefulWidget {
  const GenerateQuestionScreen(
      {super.key, required this.subjectId, required this.subjectName});
  static String id = 'generate_question_screen';
  final int? subjectId;
  final String? subjectName;

  @override
  State<GenerateQuestionScreen> createState() => _GenerateQuestionScreenState();
}

class _GenerateQuestionScreenState extends State<GenerateQuestionScreen> {
  String? amount;
  String? selectedDifficulty = 'Easy';
  List<String> difficulty = ['Easy', 'Medium', 'Hard'];
  String? selectedQuizType = 'Multiple Choice';
  List<String> quizType = ['Multiple Choice', 'True / False'];
  late int subjectId;
  late String subjectName;
  final _controller = TextEditingController();
  bool _validation = false;

  @override
  void initState() {
    subjectId = widget.subjectId!;
    subjectName = widget.subjectName!;
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '$subjectName',
          style: GoogleFonts.outfit(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generate your Quiz',
                style: kWelcomeScreenBodyTextStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _controller,
                onChanged: (value) {
                  amount = value;
                },
                keyboardType: TextInputType.number,
                decoration: kTextFieldStyle.copyWith(
                    hintText: 'Enter the Number of Questions',
                    hintStyle: GoogleFonts.outfit(
                        textStyle: TextStyle(
                      fontSize: 15,
                    )),
                    errorText: _validation ? 'Value Can\'t Be Empty' : null),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: selectedDifficulty,
                items: difficulty.map((String item) {
                  return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: kDropdownTextStyle(),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDifficulty = newValue;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: selectedQuizType,
                items: quizType.map((String item) {
                  return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: kDropdownTextStyle(),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedQuizType = newValue; // Corrected line
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                onPress: () {
                  setState(() {
                    _validation = _controller.text.isEmpty;
                  });
                  if (!_validation) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          subjectId: subjectId,
                          subjectName: subjectName,
                          amount: amount,
                          difficulty: selectedDifficulty,
                          quizType: selectedQuizType,
                        ),
                      ),
                    );
                  }
                },
                title: 'Start Quiz',
                color: Color(0xFF2100A6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
