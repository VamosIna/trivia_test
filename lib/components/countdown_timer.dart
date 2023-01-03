import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cubit = QuizCubit.get(context);
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetQuestionsSuccessState) {
          cubit.startTimer(context);
        }
        return Container(
          height: .15 * screenHeight,
          width: .15 * screenHeight,
          margin: const EdgeInsets.symmetric(vertical: 28),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 1 - cubit.seconds / cubit.maxSeconds,
                strokeWidth: 12,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                backgroundColor: Colors.pink,
              ),
              Center(
                child: Text(
                  '${cubit.seconds}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
