class Question {
  final String text;
  final bool answer;
  final int points;

  const Question(
    this.text, {
    required this.answer,
    this.points = 1,
  });
}
