import 'package:flutter/material.dart';

class GameSettingsSheet extends StatelessWidget {
  const GameSettingsSheet({super.key});

  Widget button(
      {required VoidCallback onPressed,
      required Widget child,
      required double screenWidth}) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor.withOpacity(0.9),
            Theme.of(context).cardColor.withOpacity(0.8),
            Theme.of(context).cardColor.withOpacity(0.7),
            Theme.of(context).cardColor.withOpacity(0.6),
            Theme.of(context).cardColor.withOpacity(0.5),
            Theme.of(context).cardColor.withOpacity(0),
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
          button(
              onPressed: () {},
              child: Text("Takım Ekle"),
              screenWidth: screenWidth)
        ],
      ),
    );
  }
}
