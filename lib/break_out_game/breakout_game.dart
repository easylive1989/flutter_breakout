import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_breakout/break_out_game/brick_generator.dart';
import 'package:flutter_breakout/break_out_game/paddle.dart';

class BreakoutGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(Paddle(size));
    add(BrickGenerator(position: Vector2(size.x / 2, size.y * 0.3)));
  }
}
