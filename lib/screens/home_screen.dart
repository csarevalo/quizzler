import 'package:flutter/material.dart';

import 'package:quizzler/constants/quiz_brain.dart';
import 'package:quizzler/widgets/false_button.dart';
import 'package:quizzler/widgets/question_card.dart';
import 'package:quizzler/widgets/small_score_board.dart';
import 'package:quizzler/widgets/true_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Quizzler'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
          child: QuizContent(),
        ),
      ),
    );
  }
}

class QuizContent extends StatefulWidget {
  const QuizContent({
    super.key,
  });

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  final QuizBrain quizBrain = QuizBrain();
  int netPoints = 0;

  void checkAnswer(bool ans) {
    setState(() {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      String snackBarMsg;
      Icon ansEmoji;
      if (quizBrain.currentQuestion.answer == ans && !quizBrain.completed) {
        netPoints += quizBrain.currentQuestion.points;
        snackBarMsg = 'Well Done!';
        ansEmoji = const Icon(Icons.check, color: Colors.green);
      } else {
        snackBarMsg = 'Good Try!';
        ansEmoji = const Icon(Icons.close, color: Colors.red);
      }
      if (!quizBrain.completed) {
        quizBrain.nextQuestion();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.tealAccent,
            duration: const Duration(milliseconds: 500),
            content: Row(
              children: [
                Expanded(
                  child: Text(
                    snackBarMsg,
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                ansEmoji,
              ],
            ),
          ),
        );
      } else {
        int oldScore = netPoints;
        showCompletedDialog(oldScore);
        quizBrain.reset();
        netPoints = 0;
      }
    });
  }

  Future<void> showCompletedDialog(int oldScore) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text(
              'Congratulations!',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Did you find all the right answers? That\'s okay. Try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$oldScore/${quizBrain.totalPoints} pts',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinearProgressIndicator(
          value: quizBrain.completed ? 1.0 : quizBrain.index / quizBrain.length,
        ),
        SmallScoreBoard(
          content: '$netPoints/${quizBrain.totalPoints} pts',
        ),
        Expanded(
          flex: 5,
          child: QuestionCard(
            content: quizBrain.currentQuestion.text,
          ),
        ),
        Expanded(
          flex: 1,
          child: TrueButton(
            onPressed: () {
              checkAnswer(true);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: FalseButton(
            onPressed: () {
              checkAnswer(true);
            },
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
