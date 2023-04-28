// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TabooWordsSection extends StatelessWidget {
  const TabooWordsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List dummy = [
      "Taboo Word 1",
      "Taboo Word 2",
      "Taboo Word 3",
      "Taboo Word 4",
    ];
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: dummy
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  e,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
            .toList());
  }
}
