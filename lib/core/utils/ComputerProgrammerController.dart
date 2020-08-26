import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';


class ComputerProgrammerController extends FlareControls {

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play("coding");
  }

  @override
  onCompleted(String name) {
    play("idle");
  }

}