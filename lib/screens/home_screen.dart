import 'package:flutter/material.dart';
import 'package:trivia/components/category_grid.dart';

import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xFF14284f),
      appBar: AppBar(
        title: const Text("Topics"),
        titleSpacing: 00.0,
        centerTitle: true,
        elevation: 0.00,
        backgroundColor: Color(0xFF14284f),
        leading:                   IconButton(
          icon: Icon(
              Icons.arrow_back_ios,
              size: 20),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
