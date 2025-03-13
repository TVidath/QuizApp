import 'package:flutter/material.dart';
import 'package:quiz_app_by_vidath/data/questions.dart';
import 'package:quiz_app_by_vidath/result_helper.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedanswers, required this.restart});
  final List<String> selectedanswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedanswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedanswers[i]
      });
    }
    return summary;
  }

  // /int calculateScore() {
  //   int score = 0;
  //   for (int i = 0; i < selectedanswers.length; i++) {
  //     if (selectedanswers[i] == questions[i].answers[0]) {
  //       score++;
  //     }
  //   }
  //return score;
  //}

  @override
  Widget build(BuildContext context) {
    //final score = calculateScore();

    final summary = getSummaryData();
    final score = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Score is $score/${selectedanswers.length}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            QuestionsSummary(summary),
            const SizedBox(height: 20),
            TextButton(onPressed: restart, child: const Text('RESTART QUIZ')),
            
          ],
        ),
      ),
    );
  }
}
