import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class BreakOutGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(RectangleComponent(
      position: Vector2(size.x / 2, size.y * 0.9),
      size: Vector2(100, 20),
      anchor: Anchor.center,
    ));
  }
}
