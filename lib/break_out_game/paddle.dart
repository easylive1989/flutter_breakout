import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breakout/break_out_game/breakout_game.dart';

enum PaddleState {
  movingRight,
  movingLeft,
  idle,
}

class Paddle extends RectangleComponent
    with KeyboardHandler, HasGameRef<BreakoutGame> {
  Paddle(Vector2 gameSize)
      : _velocity = gameSize.x / 3,
        super(
          position: Vector2(gameSize.x / 2, gameSize.y * 0.9),
          size: Vector2(100, 20),
          anchor: Anchor.center,
        );

  PaddleState _paddleState = PaddleState.idle;
  final double _velocity;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _paddleState = PaddleState.movingRight;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _paddleState = PaddleState.movingLeft;
    } else {
      _paddleState = PaddleState.idle;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    super.update(dt);
    var movingFactor = {
      PaddleState.movingRight: 1,
      PaddleState.movingLeft: -1,
      PaddleState.idle: 0,
    };

    position.x += movingFactor[_paddleState]! * _velocity * dt;
    if (position.x > gameRef.size.x - 50) position.x = gameRef.size.x - 50;
    if (position.x < 50) position.x = 50;
  }
}
