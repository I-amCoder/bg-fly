import 'package:flutter/material.dart';

class RemovingError extends StatelessWidget {
  const RemovingError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        titleTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        title: const Text(
          "Error while removing background",
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              label: const Text("Back"))
        ],
      ),
    );
  }
}
