import 'package:flutter/material.dart';
import 'package:taboo/pages/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taboo"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Menu
            Center(
              child: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.4,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Menu title
                      Column(
                        children: [
                          Text(
                            "Menü",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Divider(
                            indent: 8,
                            endIndent: 8,
                            thickness: 3,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),

                      // Start button
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(GamePage.routeName),
                          child: const Text("Başla"),
                        ),
                      ),

                      // Settings button
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: const Text("Ayarlar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Made by memrec Text
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: "Made by ",
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      TextSpan(
                        text: "memrec",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontStyle: FontStyle.normal),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
