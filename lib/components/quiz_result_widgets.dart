import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/screens/difficulty_screen.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import '../components/category_widget.dart';
import 'dart:math' as math;

class QuisWidget extends StatelessWidget{
  const QuisWidget({
    required this.name,
    required this.answer,
    required this.wrongAnswer
});
  final String name;
  final String answer;
  final String wrongAnswer;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.blueGrey,
            ),
           child: Column(
             children: [
               Text(
                 name,
             style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
                 fontStyle: FontStyle.italic,
                 )
               ),
               Text(
                   answer,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                   )
               ),
               Text(
                   wrongAnswer,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.redAccent,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                   )
               ),

             ],
           ),
          ),
        );
      },
    );
  }
}
