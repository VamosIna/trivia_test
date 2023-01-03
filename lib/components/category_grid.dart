import 'package:flutter/material.dart';
import 'package:trivia/components/category_widget.dart';
import 'package:trivia/shared/constants.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryWidget(name: categories[index].name, color: categories[index].color);
      })

    );
  }
}
