import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breakout/break_out_game/break_out_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameWidget(
        game: BreakOutGame(),
      ),
    );
  }
}
