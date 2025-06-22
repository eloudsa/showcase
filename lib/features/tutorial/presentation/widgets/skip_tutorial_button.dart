import 'package:flutter/material.dart';

Widget buildSkipTutorialButton({required VoidCallback onSkip}) {
  return TextButton(
    onPressed: onSkip,
    child: const Text(
      "SKIP",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
