import 'package:flutter/material.dart';
import 'package:trivia/models/category_model.dart';
import 'package:trivia/utils/Utils.dart';
import 'dart:math' as math;

final rnd = math.Random();

Color getRandomColor() => Color(rnd.nextInt(0xffffffff));

List<CategoryModel> categories = [
  CategoryModel(
    name: 'Art',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Sports',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'History',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Politics',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Celebrities',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Animals',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Video games',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Books',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'General Knowledge',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Films',
    color: getRandomColor(),
  ),
  CategoryModel(
    name: 'Mythology',
    color: getRandomColor(),
  ),

];

Map<String, int> categoriesNumbers = {
  'Art': 25,
  'Sports': 21,
  'History': 23,
  'Politics': 24,
  'Celebrities': 26,
  'Animals': 27,
  'Video games': 15,
  'Books': 10,
  'General Knowledge': 9,
  'Film': 11,
  'Mythology': 20,
};
