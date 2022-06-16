import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/material.dart' hide Image;

void main() {
  print('1. start the Game');
  runApp(GameWidget(game: ChickenGame()));
}

class ChickenGame extends FlameGame {
  double chickenScaleFactor = 3.0;
  late SpriteComponent chickenSprite;
  late SpriteAnimationComponent chicken;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    print('2. load the assets');
    Image chickenImage = await images.load('chicken.png');
    // chickenSprite = SpriteComponent.fromImage(chickenImage,
    //     srcSize: Vector2(32, 34), srcPosition: Vector2(32, 0));
    // chickenSprite.size = Vector2(32, 34) * chickenScaleFactor;
    // chickenSprite.position = Vector2.all(100);
    var chickenAnimation = SpriteAnimation.fromFrameData(
      chickenImage,
      SpriteAnimationData.sequenced(
        amount: 14,
        stepTime: 0.1,
        textureSize: Vector2(32, 34),
      ),
    );
    chicken = SpriteAnimationComponent();
    chicken.animation = chickenAnimation
    add(chickenSprite);
  }

  @override
  void update(double dt) {
    super.update(dt);
    chickenSprite.x = chickenSprite.x + 1;
    chickenSprite.y = chickenSprite.y + 1;
  }
}
