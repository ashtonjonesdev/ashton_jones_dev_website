import 'package:ashton_jones_dev_website/core/utils/SmileFaceController.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/type_writer_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ashton_jones_dev_website/core/utils/HoverExtentions.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';



class FunTab extends StatefulWidget {
  @override
  _FunTabState createState() => _FunTabState();
}

class _FunTabState extends State<FunTab> {

  bool typewriter(double width) => width > 15;

  String _typewriterText = 'I have fun, too';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PlayAnimation<double>(
              duration: 400.milliseconds,
              tween: 0.0.tweenTo(80.0),
              builder: (context, child, height) {
                return PlayAnimation<double>(
                  duration: 1600.milliseconds,
                  delay: 500.milliseconds,
                  tween: 2.0.tweenTo(300.0),
                  builder: (context, child, width) {
                    return Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColorLight,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(50),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                                spreadRadius: 5)
                          ]),
                      width: width,
                      height: height,
                      child: typewriter(width)
                          ? TypeWriterText(_typewriterText)
                          : Container(),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            child: Text(
              '🏸',
              textScaleFactor: 4,
            ),
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
                child: Image.asset('images/spikeball_play.png'),
              )),
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/spikeball_net.png'),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
