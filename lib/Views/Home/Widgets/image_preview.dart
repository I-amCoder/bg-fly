import 'package:bg_fly/Controllers/home_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Provider.of<HomeController>(context);
    final size = MediaQuery.of(context).size;

    if (imageController.isSelected) {
      return Image(
        image: FileImage(imageController.image),
        height: size.height * 0.4,
        fit: BoxFit.contain,
      );
    } else {
      return Image(
        image: const AssetImage("assets/preview.jpg"),
        height: size.height * 0.4,
      );
    }
  }
}
