import 'dart:async';
import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/arena.dart';
import 'package:flutter_breakout/break_out_game/ball.dart';
import 'package:flutter_breakout/break_out_game/brick_wall.dart';
import 'package:flutter_breakout/break_out_game/paddle.dart';

class BreakoutGame extends Forge2DGame with HasKeyboardHandlerComponents {
  BreakoutGame() : super(gravity: Vector2.zero(), zoom: 20);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    await add(BrickWall(
      position: Vector2(0.0, size.y * 0.075),
      rows: 8,
      columns: 6,
    ));
    await add(Arena());
    var ball = Ball(
      radius: 0.5,
      position: size / 2,
    );
    await add(ball);
    ball.body.applyLinearImpulse(Vector2(-10, -10));
    await add(Paddle(
      position: Vector2(size.x / 2.0, size.y * 0.85),
      size: const Size(4, 0.8),
    ));
  }
}
