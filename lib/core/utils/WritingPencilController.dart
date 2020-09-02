import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';



class WritingPencilController extends FlareControls {

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play("writing");
  }

  @override
  onCompleted(String name) {
    play("idle");
  }
  
  
  
}