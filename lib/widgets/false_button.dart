import 'package:flutter/material.dart';

class FalseButton extends StatelessWidget {
  const FalseButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FilledButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.red,
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'False',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
