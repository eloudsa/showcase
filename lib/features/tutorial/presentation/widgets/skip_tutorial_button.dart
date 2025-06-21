import 'package:flutter/material.dart';

Widget buildSkipTutorialButton({required VoidCallback onSkip}) {
  return Positioned(
    top: 40.0,
    right: 20.0,
    child: TextButton(
      onPressed: onSkip,
      child: const Text(
        "SKIP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
