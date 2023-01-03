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
            QuizCubit.get(context).startQuiz(
              context: context,
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: color,
              ),
            ),
            color: color,
            child: ListTile(
              trailing: Icon(Icons.arrow_circle_right_rounded),
              title: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

              )
            ),
          ),
        );
      },
    );
  }
}
