import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.image});

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: image);
  }
}
