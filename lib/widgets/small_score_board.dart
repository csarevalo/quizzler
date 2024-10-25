import 'package:flutter/material.dart';

class SmallScoreBoard extends StatelessWidget {
  const SmallScoreBoard({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
      child: Text(content,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blue,
          )),
    );
  }
}
