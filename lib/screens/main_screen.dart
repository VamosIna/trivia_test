import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../components/category_grid.dart';
import '../shared/cubit/cubit.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void _shareContent(String _content, String _subject) {
    Share.share(_content,subject: _subject);
  }

    @override
    Widget build(BuildContext context) {
      final textTheme = Theme.of(context).textTheme;
      return Scaffold(
        backgroundColor: Color(0xFF14284f),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
            ),
              child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Icon(
                      Icons.lightbulb_sharp,
                      color: Colors.amberAccent,
                      size: MediaQuery.of(context).size.height* 0.2),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  const SizedBox(height: 20),
                  const Text(
                    "Members.id Quiz App",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  const Text(
                    "Learn - Take Quiz - Repeat",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints:  BoxConstraints.tightFor(width: 300, height: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        QuizCubit.get(context).startQuiz(
                          context: context,
                        );
                      },
                      child:
                      Text("PLAY".toUpperCase(), style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  const  SizedBox(height: 20),
                  ConstrainedBox(
                    constraints:  BoxConstraints.tightFor(width: 300, height: 50),
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFF14284f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.blue)
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: Text(
                        "Topics".toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      ),
                    ),
                  ),
                  Container(),
                  const  SizedBox(height: 20),
                  ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300,height: 50),
                  child:
                      Container(
                        child: Row(
                          children: [
                            Spacer(
                              flex: 20,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child:RichText(
                                    text: TextSpan(
                                        text: 'Share',
                                        children: [
                                          WidgetSpan(
                                              child: Icon(
                                                Icons.share,
                                                color: Colors.green,
                                              )),
                                        ]),
                                  ),
                                  onTap: (){
                                    _shareContent("SHARE THIS APP ON :", "SHARE US");
                                  },
                                )
                              ],
                            ),
                            Spacer(
                              flex: 20,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child:RichText(
                                    text: TextSpan(
                                        text: 'Rate Us',
                                        children: [
                                          WidgetSpan(
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )),
                                        ]),
                                  ),
                                  onTap: (){
                                    _shareContent("RATE US PLS :", "RATE US");
                                  },
                                )
                              ],
                            ),
                            Spacer(
                              flex: 20,
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            )
          ),
        ),
      );
    }
}

