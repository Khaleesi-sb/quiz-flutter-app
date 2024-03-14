import 'package:flutter/material.dart';
import 'package:second_app/quiz.dart';
import 'package:second_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
