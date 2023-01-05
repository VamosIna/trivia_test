import 'package:flutter/material.dart';
import 'package:trivia/components/answer_widget.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({required this.choices, required this.index});
  final List<String> choices;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnswerWidget(answer: choices[index]);
  }
}
