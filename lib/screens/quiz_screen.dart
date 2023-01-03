import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/components/answers_grid.dart';
import 'package:trivia/components/countdown_timer.dart';
import 'package:trivia/components/gradient_widget.dart';
import 'package:trivia/components/question_widget.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import 'dart:math';
class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = 'question_screen';
  @override
  Widget build(BuildContext context) {
    final cubit = QuizCubit.get(context);
    final quizList = cubit.quizList;
    int max = 4;

    int randomNumber = Random().nextInt(max) + 1;
    return BlocConsumer<QuizCubit, QuizStates>(

      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: GradientWidget(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: state is GetQuestionLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: cubit.questionIndex / cubit.quizList.length,
                                  minHeight: 10,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${cubit.questionIndex}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                               Text(
                                '/${cubit.quizList.length.toString()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: QuestionWidget(
                              quizList[cubit.questionIndex].question,
                            ),
                          ),
                          const CountdownTimer(),
                          Expanded(
                            flex: 3,
                            child: AnswersGrid(
                              choices: [
                                quizList[randomNumber].correctAnswer,
                                quizList[randomNumber]
                                    .incorrectAnswers[0] as String,
                                quizList[randomNumber]
                                    .incorrectAnswers[1] as String,
                                quizList[randomNumber]
                                    .incorrectAnswers[2] as String,
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
