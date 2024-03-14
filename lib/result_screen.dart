import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz, {super.key, required this.chosenAnswer});

  final void Function() restartQuiz;
  final List<String> chosenAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summeryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final correctQuestion = summaryData
        .where((data) => data["user_answer"] == data["correct_answer"])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      "you answered $correctQuestion out of $numTotalQuestion questions correctly!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 201, 153, 251),
                        fontSize: 25,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionSummary(summaryData: summaryData),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: restartQuiz,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restart_alt_rounded),
                            Text(
                              "Restart Quiz",
                            ),
                          ],
                        )
                    ),
                  ),
                ])));
  }
}
