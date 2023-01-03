import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/screens/difficulty_screen.dart';
import 'package:trivia/screens/home_screen.dart';
import 'package:trivia/screens/quiz_screen.dart';
import 'package:trivia/screens/score_screen.dart';
import 'package:trivia/shared/bloc_observer.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import 'package:trivia/shared/theme/theme.dart';

void main() {
  BlocOverrides.runZoned(
    () => QuizCubit(),
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            theme: myTheme,
            routes: {
              HomeScreen.routeName: (context) => const HomeScreen(),
              QuizScreen.routeName: (context) => const QuizScreen(),
              DifficultyScreen.routeName: (context) => const DifficultyScreen(),
              ScoreScreen.routeName: (context) => const ScoreScreen(),
            },
          );
        },
      ),
    );
  }
}
