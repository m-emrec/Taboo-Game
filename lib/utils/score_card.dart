import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/provider/game_provider.dart';

/*
  - Shows the current team and their score in the @GamePage .
*/

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<Game>(
          builder: (context, game, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team Name
              Text(
                game.currentTeam["teamName"],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.deepPurple.shade900,
                    ),
              ),
              // Divider. I used a SizedBox because @Column has now defined width and @Divider needs a defined width.
              const SizedBox(
                width: 50,
                child: Divider(
                  thickness: 2,
                  // color: Theme.of(context).canvasColor,
                ),
              ),
              // Score Text
              Text(
                "Skor : ${game.currentTeam["teamScore"]}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.deepPurple.shade900,
                    ),
              ),

              // For spacing.
              const SizedBox(
                width: 15,
              ),

              // Remaining Pass count.
              Text(
                "Pas Hakkı : ${game.currentTeam["pass"]}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.deepPurple.shade900,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
