import 'package:flutter/material.dart';
import 'package:quiz_app_by_vidath/data/questions.dart';
import 'package:quiz_app_by_vidath/questions_widget.dart';
import 'package:quiz_app_by_vidath/result_screen.dart';
import 'package:quiz_app_by_vidath/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  //initstate is executed first than main
  /*void initState() {
  //and also we need to write   Widget? activescreen
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }*/

  switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; //const QuestionsScreen();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartq() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget? currentwidget;
    if (activeScreen == 'start-screen') {
      currentwidget = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      currentwidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else {
      currentwidget = ResultScreen(selectedanswers: selectedAnswers, restart: restartq,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(185, 52, 18, 221),
                Color.fromARGB(197, 8, 195, 237),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentwidget,
        ), // Your StartScreen widget
      ),
    );
  }
}
