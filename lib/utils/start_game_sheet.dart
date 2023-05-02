import 'package:flutter/material.dart';
import 'package:taboo/utils/game_settings_section.dart';

import 'add_team_section.dart';

class StartGameSheet extends StatelessWidget {
  StartGameSheet({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).canvasColor,
              Theme.of(context).canvasColor.withOpacity(0.9),
              Theme.of(context).canvasColor.withOpacity(0.8),
              Theme.of(context).canvasColor.withOpacity(0.7),
              Theme.of(context).canvasColor.withOpacity(0.6),
              Theme.of(context).canvasColor.withOpacity(0.5),
              Theme.of(context).canvasColor.withOpacity(0.4),
              Theme.of(context).canvasColor.withOpacity(0.3),
              Theme.of(context).canvasColor.withOpacity(0.2),
              Theme.of(context).canvasColor.withOpacity(0.0),
            ],
          ),
        ),
        child: Column(
          children: [
            Text(
              "Oyun Ayarları",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
              indent: 25,
              endIndent: 25,
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                   const GameSettings(),
                  AddTeam(
                    pageController: _controller,
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
