import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    required this.difficulty,
  });
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () => QuizCubit.get(context).startQuiz(
            context: context,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 32),
                const SizedBox(width: 16),
                Text(
                  difficulty,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
