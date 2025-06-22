import 'package:flutter/material.dart';

Widget buildSkipTutorialButton({
  required VoidCallback onSkip,
  Alignment alignment = Alignment.topCenter,
  EdgeInsets margin = const EdgeInsets.only(top: 80),
  double? top,
  double? bottom,
  double? left,
  double? right,
}) {
  // If specific positioning is provided, use Positioned
  if (top != null || bottom != null || left != null || right != null) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: _buildSkipButton(onSkip),
    );
  }
  
  // Otherwise use flexible alignment approach
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    child: SafeArea(
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          child: _buildSkipButton(onSkip),
        ),
      ),
    ),
  );
}

Widget _buildSkipButton(VoidCallback onSkip) {
  return GestureDetector(
    onTap: onSkip,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.skip_next,
            color: Colors.blueAccent,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            "Skip Tutorial",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
