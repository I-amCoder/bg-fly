import 'package:bg_fly/Controllers/removebg_controller.dart';
import 'package:bg_fly/Views/Widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoveBgController>(context);
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardImage(
            image: Image.file(
              controller.nonBgImage!,
              height: size.height * 0.4,
              fit: BoxFit.fill,
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                controller.saveImage(context);
              },
              icon: const Icon(Icons.download),
              label: const Text("Save to Device"))
        ],
      ),
    );
  }
}
