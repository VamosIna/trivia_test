class QuizModel {
  late String question;
  late String correctAnswer;
  late List incorrectAnswers;
  late String category;
  late String difficulty;

  QuizModel({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.category,
    required this.difficulty,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    question = json['question'] as String;
    correctAnswer = json['correctAnswer'] as String;
    incorrectAnswers = json['incorrectAnswers'] as List;
    category = json['category'] as String;
    difficulty = json['difficulty'] as String;
  }
}
