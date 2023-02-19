import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/breakout_game.dart';

class Ball extends BodyComponent<BreakoutGame> {
  final Vector2 position;
  final double radius;

  Ball({required this.position, required this.radius});

  @override
  Body createBody() {
    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position = position;

    final ball = world.createBody(bodyDef);

    final shape = CircleShape()..radius = radius;

    final fixtureDef = FixtureDef(shape);

    ball.createFixture(fixtureDef);
    return ball;
  }
}
