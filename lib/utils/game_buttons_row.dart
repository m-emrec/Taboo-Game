import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/game_provider.dart';

/*
  - Contains a Row with 3 buttons.
  - Taboo | Pass | Correct 
*/

class GameButtonsRow extends StatelessWidget {
  const GameButtonsRow({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  final PageController controller;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    const Duration animationDuration = Duration(milliseconds: 500);
    const Curve animationCurve = Curves.decelerate;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Consumer<Game>(
          builder: (context, game, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Taboo button
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red.shade300),
                  onPressed: () {
                    game.decreaseScore(game.currentTeam);
                    controller.nextPage(
                        duration: animationDuration, curve: animationCurve);
                  },
                  child: const Text("Tabu"),
                ),
              ),

              // Pass button
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  onPressed: () {
                    if (game.currentTeam["pass"] > 0) {
                      game.usePass(game.currentTeam);
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          dismissDirection: DismissDirection.horizontal,
                          margin:
                              EdgeInsets.symmetric(vertical: 64, horizontal: 8),
                          content: Text("Pas Hakkı Kalmadı !"),
                        ),
                      );
                    }
                  },
                  child: const Text("Pas"),
                ),
              ),

              // Correct button
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green.shade300),
                  onPressed: () {
                    game.increaseScore(game.currentTeam);
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: const Text("Doğru"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
