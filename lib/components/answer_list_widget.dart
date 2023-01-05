import 'package:flutter/material.dart';

import '../shared/cubit/cubit.dart';

class AnswerListWidget extends StatelessWidget{
  const AnswerListWidget({required this.choices, required this.optionList});
  final String choices;
  final List optionList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Card(
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: InkWell(
            // onTap:() =>{
            //   debugPrint(optionList[index].toString())
            //
            // },
            onTap: () => QuizCubit.get(context).answerQuestion(
              answer: choices,
              context: context,
            ),
            child: ListTile(
              title: Text(optionList[index].toString()),
            ),
          )
      ),
    );
  }

}