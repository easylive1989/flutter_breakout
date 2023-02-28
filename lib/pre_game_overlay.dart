import 'package:flutter/material.dart';

class PreGameOverlay extends StatelessWidget {
  const PreGameOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tap Paddle to Begin",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
