import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double borderRadius;

  const GradientElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.gradientColors = const [Colors.grey, Colors.blue],
    this.borderRadius = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
