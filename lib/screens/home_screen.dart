import 'package:flutter/material.dart';
import 'package:trivia/components/category_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Play",
                style: textTheme.headline1,
              ),
              const SizedBox(height: 8),
              Text(
                'Choose a category',
                style: textTheme.headline2,
              ),
              const SizedBox(height: 16),
              const CategoryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
