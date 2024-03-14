import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.all(4),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(400)),
                      color: data["user_answer"]==data["correct_answer"] ? Colors.tealAccent : Colors.redAccent,
                    ),
                      child: Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  color: Colors.deepPurple,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                                ((data['question_index'] as int) + 1).toString())
                          ],
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          data["question"] as String,
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              color: Colors.redAccent,
                              fontSize: 12,
                            ),
                            data["user_answer"] as String
                        ),
                        Text(
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              color: Colors.tealAccent,
                              fontSize: 12,
                            ),
                            data["correct_answer"] as String
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
