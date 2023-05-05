import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/utils/score_card.dart';
import 'package:taboo/utils/timer_box.dart';

import '../provider/game_provider.dart';
import '../utils/game_buttons_row.dart';
import '../utils/words_card.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  static const routeName = "game-page";

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<Game>(
            builder: (context, game, child) => Text("${game.roundIndex}.Tur"),
          ),
          centerTitle: true,
          foregroundColor: Colors.deepPurple.shade900,
        ),
        body: Stack(
          children: [
            // Timer
            const Positioned(
              top: 5,
              child: TimerBox(),
            ),
            // Score card
            const Positioned(
              top: 25,
              child: ScoreCard(),
            ),
            
            Consumer<Game>(
              builder: (context, game, child) => PageView.builder(
                itemCount: game.shuffledList.length,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) => Stack(
                  children: [
                    // Word and Taboo words
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        child: WordsCard(
                          wordData: game.shuffledList[index],
                        ),
                      ),
                    ),
                    // Tabu | Pas | Doğru Buttons
                    GameButtonsRow(
                      screenWidth: screenWidth,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


