import 'package:flutter/material.dart';
import 'package:trivia/components/difficulty_widget.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({Key? key}) : super(key: key);
  static const routeName = 'difficulty-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Choose difficulty',
                style: Theme.of(context).textTheme.headline2,
              ),
              const DifficultyWidget(
                difficulty: 'Easy',
              ),
              const DifficultyWidget(
                difficulty: 'Medium',
              ),
              const DifficultyWidget(
                difficulty: 'Hard',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
