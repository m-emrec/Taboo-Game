// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taboo/extensions/extensions.dart';

class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
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
              child: const FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 0.4,
                child: ColoredBox(
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                foregroundColor: Colors.white,
                radius: 25,
                child: Row(
                  children: const [
                    Icon(Icons.timer_outlined),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      "15",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // radius: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
