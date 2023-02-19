import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breakout/break_out_game/ball.dart';
import 'package:flutter_breakout/break_out_game/brick_generator.dart';
import 'package:flutter_breakout/break_out_game/paddle.dart';

class BreakoutGame extends Forge2DGame with HasKeyboardHandlerComponents {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // add(Paddle(size));
    // add(BrickGenerator(position: Vector2(size.x / 2, size.y * 0.3)));
    add(Ball(
      radius: 1.0,
      position: size / 2,
    ));
  }
}
