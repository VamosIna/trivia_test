import 'package:flutter/material.dart';
import 'package:trivia/components/answer_widget.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({required this.choices});
  final List<String> choices;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, index) => AnswerWidget(answer: choices[index]),
      itemCount: 4,
    );
  }
}
