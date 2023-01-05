// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trivia/shared/cubit/cubit.dart';
// import 'package:trivia/shared/cubit/states.dart';
//
// import '../components/category_widget.dart';
// import 'dart:math' as math;
//
// import '../components/quiz_result_widgets.dart';
// class ScoreScreen extends StatelessWidget {
//   const ScoreScreen({Key? key}) : super(key: key);
//   static const routeName = 'score_screen';
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final cubit = QuizCubit.get(context);
//     return BlocConsumer<QuizCubit, QuizStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         // return Scaffold(
//         //   appBar: AppBar(
//         //     title: const Text('AppBar Demo'),
//         //
//         //   ),
//         //   body: SafeArea(
//         //     child: Padding(
//         //       padding: const EdgeInsets.symmetric(horizontal: 32),
//         //       child: SingleChildScrollView(
//         //         child: Container(
//         //           padding: EdgeInsets.all(20),
//         //           child: Column(
//         //             mainAxisAlignment: MainAxisAlignment.center,
//         //             crossAxisAlignment: CrossAxisAlignment.stretch,
//         //             children: [
//         //               // Row(
//         //               //   children: [
//         //               //     Text(
//         //               //       'Total Score',
//         //               //       style: Theme.of(context).textTheme.headline2,
//         //               //     ),
//         //               //     Text(
//         //               //       '${cubit.score}',
//         //               //       style: Theme.of(context).textTheme.headline2,
//         //               //     ),
//         //               //   ],
//         //               // ),
//         //               for (var i in cubit.quizList) ...[
//         //             Container(
//         //               child:
//         //                 ListView.builder(
//         //                     itemCount: 5,
//         //                     itemBuilder: (BuildContext context, int index) {
//         //                         return  QuisWidget(name: i.question,
//         //                               answer: cubit.selectedAnswer.toString(),
//         //                               trueAnswer: i.correctAnswer,
//         //                               wrongAnswer: i.incorrectAnswers.toString());
//         //
//         //                     }
//         //                     ),
//         //
//         //             )
//         //               ],
//         //             //   for (var i in cubit.quizList) ...[
//         //             //     Divider(),
//         //             //     QuisWidget(
//         //                        name: i.question,
//         //             //         answer: cubit.selectedAnswer.toString(),
//         //             //         trueAnswer: i.correctAnswer,
//         //             //         wrongAnswer: i.incorrectAnswers.toString()),
//         //             // ],
//         //           ]
//         //           ),
//         //         ),
//         //       )
//         //     ),
//         //   ),
//         // );
//         return Scaffold(
//           body:Container(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [

//               ]
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
