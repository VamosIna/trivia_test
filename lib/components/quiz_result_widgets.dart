import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/screens/difficulty_screen.dart';
import 'package:trivia/shared/cubit/cubit.dart';
import 'package:trivia/shared/cubit/states.dart';
import '../components/category_widget.dart';
import 'dart:math' as math;

class QuisWidget extends StatelessWidget{
  QuisWidget({
    this.name,
    this.answer,
    this.wrongAnswer,
    this.trueAnswer,

});
  String? name;
  String? answer;
  List? wrongAnswer;
  String? trueAnswer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child:  Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.8,
                              child: Text(
                                name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //     "Your Answer : $answer",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontStyle: FontStyle.italic,
                        //     )
                        // ),
                        //
                        // Text(
                        //     "lighter : ${trueAnswer} a.k.a Correct",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontStyle: FontStyle.italic,
                        //     )
                        // ),
                        trueAnswer == answer ? RichText(
                          text: TextSpan(
                              text: '$answer',
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                        Icons.done,
                                      color: Colors.green,
                                    )),
                              ]),
                        ) : Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '$answer',
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )),
                                  ]),
                            ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                  text: '$trueAnswer',
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )),
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8,bottom: 8)),
                      ],
                    ),
                  )
                ],
              )
            )
          ],

        );
      },
    );
  }
}
