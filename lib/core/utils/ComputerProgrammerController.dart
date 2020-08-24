import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';


class ComputerProgrammerController extends FlareControls {

  // Fetch references for the `ctrl_face` node and store a copy of its original translation.
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