import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              // color: const Color.fromARGB(150, 255, 255, 255),
              'assets/images/quiz_img.png'),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(61, 70, 64, 64)),
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
