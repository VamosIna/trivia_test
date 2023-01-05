import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trivia/models/quiz_model.dart';
import 'package:trivia/screens/quiz_screen.dart';
import 'package:trivia/screens/score_screen.dart';
import 'package:trivia/shared/constants.dart';
import 'package:trivia/shared/cubit/states.dart';

import '../../screens/home_screen.dart';
import '../../screens/main_screen.dart';
import '../../screens/score_screen_final.dart';
import 'dart:math' as math;


class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());
  static QuizCubit get(BuildContext context) => BlocProvider.of(context);

  final baseUrl = 'https://opentdb.com';
  String? category;
  var rnd = math.Random();

  int? getCategoryNumber() => categoriesNumbers[category];

  void getQuestions() {
    Uri url;
    int? categoryNumber = getCategoryNumber();
    if(categoryNumber!=null){
      url = Uri.parse('$baseUrl/api.php?amount=5&category=$categoryNumber&difficulty=easy&type=multiple');
    }else{
      url = Uri.parse('$baseUrl/api.php?amount=5&category=&difficulty=easy&type=multiple');
    }

    // if(categoryNumber!=null){
    //    url = Uri.parse(
    //     '$baseUrl/api.php?amount=5&category=$categoryNumber&difficulty=easy&type=multiple',
    //   ) as Url?;
    // }else{
    //   url = Uri.parse(
    //     '$baseUrl/api.php?amount=5&difficulty=easy&type=multiple',
    //   ) as Url?;
    // }
    http.get(url).then((response) {
      debugPrint(response.toString());
      print(response.toString());
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List;
      for (final quizData in results) {
        quizData as Map;
        final quiz = QuizModel(
          question: quizData['question'] as String,
          correctAnswer: quizData['correct_answer'] as String,
          incorrectAnswers: quizData['incorrect_answers'] as List,
          category: quizData['category'] as String,
          difficulty: quizData['difficulty'] as String,
        );
        quizList.add(quiz);
        emit(GetQuestionsSuccessState());
      }
    }).catchError((error) {
      emit(GetQuestionsErrorState(error.toString()));
    });
  }

  final List<QuizModel> quizList = [];
  final List<String> wrongAnswerList = [];
  final List<String> trueAnswerList = [];
  final List<String> selectedAnswer = [];

  int questionIndex = 0;
  int score = 0;

  final maxSeconds = 30;
  int seconds = 30;
  Timer? timer;
  void startTimer(BuildContext context) {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (seconds > 0) {
          seconds--;
          emit(CountDownState());
        } else {
          timeUp(context);
        }
      },
    );
  }

  void startQuiz({
    required BuildContext context,
  }) {
    emit(GetQuestionLoadingState());
    if(quizList.isNotEmpty){
      resetQuiz(context);
    }else{
      getQuestions();
    }
    Navigator.of(context).pushReplacementNamed(QuizScreen.routeName);
  }

  void answerQuestion({
    required String answer,
    required BuildContext context,
  }) {
    selectedAnswer.add(answer);
    print("TEST-SELECTED ================================ ${selectedAnswer.toString()}.");
    print("TEST-TRUE ================================ ${quizList[questionIndex].correctAnswer.toString()}.");
    print("TEST-FALSE ================================ ${quizList[questionIndex].incorrectAnswers.toString()}.");
    if (answer.contains(quizList[questionIndex].correctAnswer)) {
      score++;
      // wrongAnswerList.forEach((element) {
      //   element.incorrectAnswers =answer as List;
      // });
      // trueAnswerList.add(quizList[questionIndex].correctAnswer.toString());
      // // trueAnswerList.forEach((element) {element.correctAnswer.toString(); });
        trueAnswerList.add(answer);
        wrongAnswerList.add(quizList[questionIndex].incorrectAnswers.toString());
      print("TEST-TRUE ================================ ${quizList[questionIndex].correctAnswer.toString()}.");
      print("TEST-FALSE ================================ ${quizList[questionIndex].incorrectAnswers.toString()}.");
      print(answer +" = jawaban asli == "+quizList[questionIndex].correctAnswer.toString());
    }
    if (questionIndex == 4) {
      endQuiz(context);
    } else {
      questionIndex++;
      seconds = 30;
    }
    emit(AnswerQuestionState());
  }

  void timeUp(BuildContext? context) {
    if (questionIndex <= 4) {
      questionIndex++;
      seconds = 10;
      emit(TimeUpState());
    } else {
      endQuiz(context!);
    }
  }

  void endQuiz(BuildContext? context) {
    Navigator.of(context!).pushReplacementNamed(ScoreScreen.routeName);
    emit(EndQuizState());
  }
  void resetQuiz(BuildContext? context) {
    Navigator.of(context!).pushReplacementNamed(MainScreen.routeName);
    quizList.clear();
    questionIndex =0;
    timer?.cancel();
    score=0;
    emit(EndQuizState());
  }
}
