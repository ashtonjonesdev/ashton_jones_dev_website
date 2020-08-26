import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class SmileFaceController extends FlareControls {

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play("Smile Face");
  }

  @override
  onCompleted(String name) {
    play("idle");
  }

}