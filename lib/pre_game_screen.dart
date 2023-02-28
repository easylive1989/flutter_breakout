import 'package:flutter/material.dart';

class PreGameScreen extends StatelessWidget {
  const PreGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Start"),
        ),
      ),
    );
  }
}
