import 'package:flame/extensions.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_breakout/break_out_game/breakout_game.dart';
import 'package:forge2d/src/dynamics/body.dart';

class Brick extends BodyComponent<BreakoutGame> {
  Brick({
    required this.size,
    required this.position,
  });

  final Size size;
  final Vector2 position;

  @override
  Body createBody() {
    var bodyDef = BodyDef()
      ..type = BodyType.static
      ..position = position;

    var brickBody = world.createBody(bodyDef);

    var shape = PolygonShape()
      ..setAsBox(
        size.width / 2,
        size.height / 2,
        Vector2(0, 0),
        0,
      );

    brickBody.createFixture(
      FixtureDef(shape)
        ..density = 100.0
        ..friction = 0.0
        ..restitution = 0.1,
    );
    return brickBody;
  }
}
