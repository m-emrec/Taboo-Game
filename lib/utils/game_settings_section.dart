import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/pages/game_page.dart';

import '../provider/game_provider.dart';
import 'custom_slider.dart';

/*
  - Players can set the Duration of one round , number of rounds and number of pass.
*/

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Game>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // game duration
        CustomSlider(
          minMalue: 60,
          maxValue: 180,
          value: provider.gameDuration.toDouble(),
          title: "Oyun Süresi",
          division: 4,
          func: provider.setGameDuration,
        ),
        // Number of round
        CustomSlider(
          title: "Tur Sayısı",
          minMalue: 2,
          maxValue: 10,
          value: provider.numberOfRounds.toDouble(),
          division: 4,
          func: provider.setNumberOfRounds,
        ),
        // PAss
        CustomSlider(
          maxValue: 5,
          value: provider.numberOfPass.toDouble(),
          title: "Pas Hakkı",
          division: 5,
          func: provider.setNumberOfPass,
        ),

        // Start game button
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<Game>(context, listen: false).startGame();
                Navigator.of(context).pushReplacementNamed(GamePage.routeName);
              },
              child: const Text("Başla"),
            ),
          ),
        )
      ],
    );
  }
}
