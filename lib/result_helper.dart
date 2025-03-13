import 'package:flutter/material.dart';
//import 'package:quiz_app_by_vidath/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(context) {
    final screenHeight = MediaQuery.of(context).size.height; 
    return SizedBox(
      height: screenHeight/2,
      child:SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CircleAvatar(
                  backgroundColor: isCorrect ? Colors.green : Colors.red,
                  radius: 20,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                  Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text(data['question'] as String,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(data['user_answer'] as String,style: TextStyle(color: isCorrect ? const Color.fromARGB(255, 28, 112,11) : const Color.fromARGB(255, 215, 51, 39),
                        ),),
                  Text(data['correct_answer'] as String,style: TextStyle(color: Color.fromARGB(255, 28, 112, 11)),),
                  SizedBox(height: 10,),
                ],),
              ),
        
            ],);
          }).toList(),
        ),
      ),
    );
  }
}
