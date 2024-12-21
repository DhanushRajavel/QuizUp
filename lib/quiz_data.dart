import 'package:http/http.dart' as http;
import 'dart:convert';
Future<List<QuizData>> getQuestions(int subjectId , String amount , String difficulty , String type) async {
  final response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=$amount&category=$subjectId&difficulty=${difficulty.toLowerCase()}&type=${type == 'Multiple Choice' ? 'multiple' : 'boolean'}'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['results'] as List)
        .map((question) => QuizData.fromJson(question))
        .toList();
  } else {
    throw Exception('Failed to load questions');
  }
}

class QuizData {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizData({required this.question, required this.options, required this.correctAnswer});

  factory QuizData.fromJson(Map<String, dynamic> json) {
    final options = (json['incorrect_answers'] as List).cast<String>();
    options.add(json['correct_answer']);
    options.shuffle(); // Randomize options order

    return QuizData(
      question: json['question'],
      options: options,
      correctAnswer: json['correct_answer'],
    );
  }
}
String showResult(int src , int length){
  length = length * 2;
    if(src == length){
     return 'Excellent';
    }
    else if(src >= length - 5){
      return 'Very Good';
    }
    else if(src >= length - 10)
    {
      return 'Good';
    }
    else{
      return 'Don\'t Worry , try again';
    }
}
String getPerformanceMessage(int src , int length) {
  length = length * 2;
  if (src == length) {
    return 'Excellent: Your performance is outstanding! Keep up the great work.';
  } else if (src >= length - 5) {
    return 'Very Good: You are doing very well. A little more effort can take you to the top!';
  } else if (src >= length - 10) {
    return 'Good: You have a good grasp of the material. Keep practicing to improve even more.';
  } else {
    return 'Don\'t Worry: It\'s okay to make mistakes. Review the material and try again with a fresh perspective.';
  }
}
