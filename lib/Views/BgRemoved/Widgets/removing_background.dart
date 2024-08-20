import 'package:bg_fly/Views/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RemovingBackground extends StatelessWidget {
  const RemovingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.prograssiveDots(
            color: Colors.amber,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Creating Magic!",
            style: titleStyle,
          )
        ],
      ),
    );
  }
}
