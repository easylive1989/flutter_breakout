import 'dart:async';
import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/arena.dart';
import 'package:flutter_breakout/break_out_game/ball.dart';
import 'package:flutter_breakout/break_out_game/brick_wall.dart';
import 'package:flutter_breakout/break_out_game/dead_zone.dart';
import 'package:flutter_breakout/break_out_game/game_state.dart';
import 'package:flutter_breakout/break_out_game/paddle.dart';

class BreakoutGame extends Forge2DGame
    with HasKeyboardHandlerComponents, HasTappables {
  BreakoutGame() : super(gravity: Vector2.zero(), zoom: 20);

  GameState gameState = GameState.initializing;
  late Ball _ball;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    await add(BrickWall(
      position: Vector2(0.0, size.y * 0.075),
      rows: 8,
      columns: 6,
    ));
    await add(Arena());
    _ball = Ball(
      radius: 0.5,
      position: size / 2,
    );
    await add(_ball);
    await add(Paddle(
      position: Vector2(size.x / 2.0, size.y * 0.85),
      size: const Size(4, 0.8),
    ));
    await add(DeadZone(
      size: Vector2(100, size.y * 0.1),
      position: Vector2(size.x / 2.0, size.y),
    ));
    gameState = GameState.ready;
    overlays.add("preGame");
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    if (gameState == GameState.ready) {
      overlays.remove("preGame");
      _ball.body.applyLinearImpulse(Vector2(-10.0, -10.0));
      gameState = GameState.running;
    }
    super.onTapDown(pointerId, info);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if ([GameState.won, GameState.lost].contains(gameState)) {
      pauseEngine();
      overlays.add("gameOver");
    }
  }
}
