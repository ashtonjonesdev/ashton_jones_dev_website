import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class JumpAndPhoneController extends FlareControls {

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play("check-success");
  }

  @override
  onCompleted(String name) {
    play("idle");
  }


}