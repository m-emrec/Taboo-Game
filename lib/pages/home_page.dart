import 'package:flutter/material.dart';
import 'package:taboo/utils/change_team_pop_up.dart';
import 'package:taboo/utils/start_game_sheet.dart';

import '../utils/settings_sheet.dart';

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
            // Menu Card
            Center(
              child: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.4,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.6,
                                child: ElevatedButton(
                                  onPressed: () => showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (_) => StartGameSheet(),
                                  ),
                                  child: const Text("Oyunu Başlat"),
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                        // // Settings button
                        // SizedBox(
                        //   width: screenWidth * 0.6,
                        //   child: ElevatedButton(
                        //     onPressed: () => showModalBottomSheet(
                        //       backgroundColor: Colors.transparent,
                        //       context: context,
                        //       builder: (_) => const SettingSheet(),
                        //     ),
                        //     child: const Text("Ayarlar"),
                        //   ),
                        // ),
                      ],
                    ),
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
