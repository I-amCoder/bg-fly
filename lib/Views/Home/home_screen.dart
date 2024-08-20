import 'package:bg_fly/Views/Home/Widgets/image_uploader.dart';
import 'package:bg_fly/Views/layout.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset(
              "assets/logo-no-bg.png",
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "BG FLY",
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: const Layout(
        child: ImageUploader(),
      ),
    );
  }
}
