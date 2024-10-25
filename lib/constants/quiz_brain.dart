import 'package:quizzler/models/question.dart';

class QuizBrain {
  /// Used to index through QuizBank
  int index = 0;

  /// Used to signal when quiz is completed
  bool completed = false;

  /// The QuizBank is full of questions with answers
  static const List<Question> _quizBank = [
    Question(
      'Some cats are actually allergic to humans',
      answer: true,
    ),
    Question(
      'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      answer: true,
    ),
    Question(
      'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    Question(
      'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      'Google was originally called \"Backrub\".',
      answer: true,
    ),
    Question(
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  /// Get QuizBank length
  int get length => _quizBank.length;

  /// Get total points available throughout all questions
  int get totalPoints => _totalPointsAvailable();
  int _totalPointsAvailable() {
    int netPoints = 0;
    for (var q in _quizBank) {
      netPoints += q.points;
    }
    return netPoints;
  }

  /// Get current QuizBank question
  Question get currentQuestion => _quizBank[index];

  /// Get next Question
  void nextQuestion() {
    if (index < _quizBank.length - 1) {
      index++;
    } else {
      completed = true;
    }
  }

  /// Reset QuizBrain
  void reset() {
    index = 0;
    completed = false;
  }
}
