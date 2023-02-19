import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/arena.dart';
import 'package:flutter_breakout/break_out_game/ball.dart';
import 'package:flutter_breakout/break_out_game/brick_wall.dart';

class BreakoutGame extends Forge2DGame with HasKeyboardHandlerComponents {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // add(Paddle(size));
    add(BrickWall(
      position: Vector2(0.0, size.y * 0.075),
      rows: 8,
      columns: 6,
    ));
    add(Arena());
    add(Ball(
      radius: 1.0,
      position: size / 2,
    ));
  }
}
