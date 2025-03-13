import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton( {super.key,
    required this.answertext,
    required this.onTap
  });
  //const AnswerButton(this.answer,this.onTap, {super.key}); 
  //thes are positional arguments in above the =y are named arguments they are optional so we type
  //required they now work as positional 
  final String answertext;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
          backgroundColor: const Color.fromARGB(255, 66, 7, 227),
          foregroundColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
        ),
        child: Text(answertext,textAlign: TextAlign.center,));
  }
}
