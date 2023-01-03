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

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());
  static QuizCubit get(BuildContext context) => BlocProvider.of(context);

  final baseUrl = 'https://opentdb.com';
  late String category;

  int getCategoryNumber() => categoriesNumbers[category]!;

  void getQuestions() {
    final categoryNumber = getCategoryNumber();
    final url = Uri.parse(
      '$baseUrl/api.php?amount=5&category=$categoryNumber&difficulty=easy&type=multiple',
    );
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
  final List<QuizModel> wrongAnswerList = [];

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
    getQuestions();
    Navigator.of(context).pushReplacementNamed(QuizScreen.routeName);
  }

  void answerQuestion({
    required String answer,
    required BuildContext context,
  }) {
    if (answer.contains(quizList[questionIndex].correctAnswer)) {
      score++;
      print(answer +" = jawaban asli == "+quizList[questionIndex].correctAnswer.toString());
    }
    if (questionIndex == 4) {
      endQuiz(context);
    } else {
      questionIndex++;
      seconds = 10;
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
}
