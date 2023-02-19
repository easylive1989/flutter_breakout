import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_breakout/break_out_game/paddle.dart';

class BreakOutGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(Paddle(size));
  }
}
