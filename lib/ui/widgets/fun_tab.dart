import 'package:ashton_jones_dev_website/core/utils/SmileFaceController.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunTab extends StatefulWidget {
  @override
  _FunTabState createState() => _FunTabState();
}

class _FunTabState extends State<FunTab> {
  SmileFaceController _smileFaceController = SmileFaceController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: FlareActor(
            'assets/smile_face.flr',
            controller: _smileFaceController,
            shouldClip: false,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Text(
          '🏸',
          textScaleFactor: 4,
        ),
        SizedBox(height: 30),
        // TODO: Fix images sizes
        Expanded(flex: 1, child: Image.asset('images/badminton.png', fit: BoxFit.contain)),
        Divider(
          height: 40,
          thickness: 5,
        ),
        Text('🕸️', textScaleFactor: 4,),
        SizedBox(height: 30),
        Expanded(flex: 1, child: Image.asset('images/spikeball.png', fit: BoxFit.contain,))
      ],
    );
  }
}
