// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taboo/utils/timer_box.dart';

import '../utils/words_card.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  static const routeName = "game-page";

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Team Name"),
          centerTitle: true,
          foregroundColor: Colors.deepPurple.shade900,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 5,
              child: TimerBox(),
            ),
            PageView.builder(
              controller: controller,
              itemBuilder: (context, index) => Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: WordsCard(),
                    ),
                  ),
                  GameButtonsRow(
                    screenWidth: screenWidth,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    final Duration animationDuration = Duration(milliseconds: 500);
    const Curve animationCurve = Curves.decelerate;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Taboo button
            SizedBox(
              width: screenWidth * 0.3,
              child: ElevatedButton(
                onPressed: () => controller.nextPage(
                    duration: animationDuration, curve: animationCurve),
                child: Text("Tabu"),
              ),
            ),

            // Pass button
            SizedBox(
              width: screenWidth * 0.3,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text("Pas"),
              ),
            ),

            // Correct button
            SizedBox(
              width: screenWidth * 0.3,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text("Doğru"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
