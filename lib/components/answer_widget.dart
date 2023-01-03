import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trivia/shared/cubit/cubit.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    final numberOfWords = answer.split(' ').length;
    return InkWell(
      onTap: () => QuizCubit.get(context).answerQuestion(
        answer: answer,
        context: context,
      ),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Center(
          child: AutoSizeText(
            answer,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
            maxLines: numberOfWords,
          ),
        ),
      ),
    );
  }
}
