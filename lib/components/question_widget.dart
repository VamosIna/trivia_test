import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(this.questionText);
  final String questionText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
        questionText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
