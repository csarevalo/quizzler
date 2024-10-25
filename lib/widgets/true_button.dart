import 'package:flutter/material.dart';

class TrueButton extends StatelessWidget {
  const TrueButton({
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
            Color.fromARGB(255, 88, 214, 93),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'True',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
