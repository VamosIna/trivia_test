import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/components/answers_grid.dart';
import 'package:trivia/components/countdown_timer.dart';
import 'package:trivia/components/gradient_widget.dart';
import 'package:trivia/components/question_widget.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import 'dart:math';

import 'home_screen.dart';
// class QuizScreen extends StatelessWidget {
//   const QuizScreen({Key? key}) : super(key: key);
//   static const routeName = 'question_screen';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = 'question_screen';
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // QuizCubit cubit = QuizCubit();
  // final cubit = QuizCubit.get(context);
  // final cubit = BlocProvider.of(context);
  var optionList =[];
  // @override
  // void initState() {
  //   // optionList = cubit.quizList[cubit.questionIndex].incorrectAnswers;
  //   // optionList.add(cubit.quizList[cubit.questionIndex].correctAnswer);
  //   // optionList.shuffle();
  //   super.initState();
  // }
  @override
  void initState() {
    if(optionList.isNotEmpty){
      optionList.shuffle();
    }
    super.initState();
    final cubit = QuizCubit.get(context);
    // optionList = cubit.quizList[cubit.questionIndex].incorrectAnswers;
    // // optionList.add(cubit.quizList[cubit.questionIndex].incorrectAnswers);
    // optionList.add(cubit.quizList[cubit.questionIndex].correctAnswer);
  }
  @override
  Widget build(BuildContext context) {
    final cubit = QuizCubit.get(context);
    final quizList = cubit.quizList;
    int max = 4;
    int randomNumber = Random().nextInt(max) + 1;
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {
        optionList = cubit.quizList[cubit.questionIndex].incorrectAnswers;
        // optionList.add(cubit.quizList[cubit.questionIndex].incorrectAnswers);
         optionList.add(cubit.quizList[cubit.questionIndex].correctAnswer);
        // if(optionList.length <= 3 ){
        //   optionList.addAll(cubit.quizList[cubit.questionIndex].incorrectAnswers);
        //   optionList.add(cubit.quizList[cubit.questionIndex].correctAnswer);
        //   print(optionList.toList().toString());
        // }else{
        //   // optionList.shuffle();
        if(optionList.length>=5){
          optionList.removeLast();
        }
          print(optionList.toList().toString());
        // }

      },
    bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF14284f),
          appBar: AppBar(
            title: const Text("Quiz Page"),
            titleSpacing: 00.0,
            centerTitle: true,
            elevation: 0.00,
            backgroundColor: Color(0xFF14284f),
            leading:IconButton(
              icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20),
              onPressed: () {
                BlocProvider.of<QuizCubit>(context)..resetQuiz(context);
              },
            ),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(2.0),
              child: cubit.quizList.isEmpty ? Container() : Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: cubit.questionIndex / cubit.quizList.length,
                      minHeight: 5,
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
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: state is GetQuestionLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          const SizedBox(height: 8),
                          Expanded(
                            child: QuestionWidget(
                              cubit.quizList[cubit.questionIndex].question.toString(),
                            ),
                          ),
                          const CountdownTimer(),
                          Expanded(
                            flex: 3,
                            child: ListView.builder(
                                  itemCount: 4,
                                    itemBuilder: (context, index) => Card(
                                      elevation: 6,
                                      margin: const EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap:() =>{
                                          debugPrint(optionList[index].toString()),
                                         cubit.answerQuestion(answer: optionList[index].toString(), context: context)
                                        },
                                        child: ListTile(
                                          title: Text(optionList[index].toString()),
                                        ),
                                      )
                                    ),
                            )
                          ),
                        ],
                      ),
              ),
            ),
        );
      },
    );
  }

}
