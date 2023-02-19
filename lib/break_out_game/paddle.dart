import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/breakout_game.dart';

class Paddle extends BodyComponent<BreakoutGame> {
  Paddle({required this.position, required this.size});

  final Vector2 position;
  final Size size;

  @override
  Body createBody() {
    var bodyDef = BodyDef()
      ..type = BodyType.static
      ..position = position;

    var paddleBody = world.createBody(bodyDef);

    final shape = PolygonShape()
      ..setAsBox(
        size.width / 2,
        size.height / 2,
        Vector2(0, 0),
        0,
      );

    paddleBody.createFixture(FixtureDef(shape));

    return paddleBody;
  }
}
