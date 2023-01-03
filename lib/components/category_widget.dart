import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/screens/difficulty_screen.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            QuizCubit.get(context).category = name;
            Navigator.of(context).pushNamed(DifficultyScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: color,
            ),
            child: ListTile(
              trailing: Icon(Icons.arrow_circle_right_rounded),
              title: Text(
                    name,
                    style: Theme.of(context).textTheme.headline3,
              )
            ),
          ),
        );
      },
    );
  }
}
