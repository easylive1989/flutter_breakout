import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breakout/break_out_game/breakout_game.dart';

class BrickGenerator extends PositionComponent with HasGameRef<BreakoutGame> {
  BrickGenerator({super.position}) : super(anchor: Anchor.center);

  final List<Color> colors = [
    Colors.white,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.grey,
    Colors.black,
    Colors.brown,
  ];

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    var totalXofBricks = gameRef.size.x * 0.8 ~/ 50;
    var totalYofBricks = gameRef.size.y * 0.4 ~/ 20;
    var initXofBricks = -totalXofBricks * 50 / 2;
    var initYofBricks = -totalYofBricks * 20 / 2;

    List.generate(totalYofBricks, (yIndex) {
      List.generate(totalXofBricks, (xIndex) {
        var paint = Paint()..color = colors[(xIndex + yIndex) % colors.length];
        add(RectangleComponent(
            position: Vector2(
              initXofBricks + xIndex * 50,
              initYofBricks + yIndex * 20,
            ),
            size: Vector2(50, 20),
            paint: paint,
        ));
      });
    });
  }
}
