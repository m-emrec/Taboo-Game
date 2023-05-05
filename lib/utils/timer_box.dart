import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/provider/game_provider.dart';
import 'package:taboo/utils/change_team_pop_up.dart';

class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  late Timer _timer;
  int _remainingTime = 0;
  late int _duration;

  // This function starts the timer
  void _startTimer(int duration, DateTime startTime) {
    setState(() {
      _remainingTime = duration;
    });
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        var elapsedTime = DateTime.now().difference(startTime);
        setState(
          () {
            _remainingTime = _duration - elapsedTime.inSeconds ;
          },
        );
        // if remaining time is 0 cancel the time and show @ChangeTeamPopUp
        if (_remainingTime == 0) {
          timer.cancel();

          showDialog(
            context: context,
            builder: (_) => const ChangeTeamPopUp(),
          ).then(
            // here @ChangeTeamPopUp sends back a boolean value to this widget when it's popped
            //if the value is null timer will be started again.
            // if it's not true then timer will be canceled.
            (arg) {
              if (arg ?? false) {
                _timer.cancel();
              } else {
                _startTimer(
                  duration,
                  DateTime.now(),
                );
              }
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final DateTime startTime = DateTime.now();
    _duration = Provider.of<Game>(context, listen: false).gameDuration;

    _startTimer(_duration, startTime);
  }

  @override
  void dispose() {
    // When this widget removed from the Tree stop @timer
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
            //Timer Bar
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
            // Timer Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  foregroundColor: Colors.white,
                  radius: 25,
                  child: FittedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.timer_outlined),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "$_remainingTime",
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
