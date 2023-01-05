import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trivia/screens/home_screen.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import 'package:trivia/utils/Utils.dart';

import '../components/category_widget.dart';
import 'dart:math' as math;

import '../components/quiz_result_widgets.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);
  static const routeName = 'score_screen';

  void _shareContent(String _content) {
    Share.share(_content);
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme
        .of(context)
        .textTheme;
    final cubit = QuizCubit.get(context);
    return BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFF14284f),
              appBar: AppBar(
                title: const Text("Your Score"),
                titleSpacing: 00.0,
                centerTitle: true,
                elevation: 0.00,
                backgroundColor: Color(0xFF14284f),
                leading:                   IconButton(
                  icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20),
                  onPressed: () {
                    BlocProvider.of<QuizCubit>(context).resetQuiz(context);
                  },
                ),
              ),
            body: Column(
              children: [
                  Container(
                    height: .15 * screenHeight,
                    width: .15 * screenHeight,
                    margin: const EdgeInsets.symmetric(vertical: 28),
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: cubit.questionIndex != 0 ? cubit.score/cubit.questionIndex : 1,
                          strokeWidth: 12,
                          valueColor: const AlwaysStoppedAnimation(Colors.red),
                          backgroundColor: Colors.green,
                        ),
                        Center(
                          child: Text(
                            '${cubit.score} / 5',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(padding: EdgeInsets.only(top: 8,bottom: 8)),
                ElevatedButton.icon(
                    onPressed: () => {
                      _shareContent("Hai, Saya berhasil mendapatkan Score ${cubit.score} dari ${cubit.questionIndex} Quiz loh, Legoo Donlot yakk")
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Share This Score')),
                Text(
                  'Your Report',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8,bottom: 8)),
                Expanded(
                  child: SizedBox.expand(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                          right: 8,
                          bottom: 8
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return QuisWidget(
                          name: cubit.quizList[index].question.isNotEmpty ? cubit.quizList[index].question:"null"  ,
                          answer: cubit.selectedAnswer[index].toString(),
                          wrongAnswer: cubit.quizList[index].incorrectAnswers,
                          trueAnswer: cubit.quizList[index].correctAnswer,
                        );
                      },
                    ),
                  ),

                ),
              ],
            )
          );
        }
    );
  }
}
