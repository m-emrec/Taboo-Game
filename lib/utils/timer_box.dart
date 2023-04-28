// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/logger.dart';
import 'package:taboo/pages/end_screen.dart';
import 'package:taboo/provider/game_provider.dart';

class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  late Timer _timer;
  late int _remainingTime;
  late int _duration;

  void _startTimer(int duration, DateTime startTime) {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        var elapsedTime = DateTime.now().difference(startTime);

        setState(
          () {
            _remainingTime = _duration - elapsedTime.inSeconds;
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final DateTime startTime = DateTime.now();
    _duration = Provider.of<Game>(context, listen: false).gameDuration;
    _remainingTime = _duration;
    _startTimer(_duration, startTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).cardColor.withOpacity(0.5),
              child: FractionallySizedBox(
                alignment: Alignment.topRight,
                widthFactor: _remainingTime / _duration,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade500,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  foregroundColor: Colors.white,
                  radius: 25,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Icon(Icons.timer_outlined),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            "$_remainingTime",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
