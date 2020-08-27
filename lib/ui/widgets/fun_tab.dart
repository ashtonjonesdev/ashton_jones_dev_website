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
    return SingleChildScrollView(
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/badminton.png'),
              )),
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/badminton2.png'),
              )),
            ],
          ),
          Divider(
            height: 40,
            thickness: 5,
          ),
          Text('🕸️', textScaleFactor: 4,),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/spikeball.png'),
              )),
              // TODO: Add personal Spikeball image
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/badminton2.png'),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
