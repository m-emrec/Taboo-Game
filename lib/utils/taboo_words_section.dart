// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

/*
  - a ListView of the taboo words.
*/

class TabooWordsSection extends StatelessWidget {
  const TabooWordsSection({
    super.key,
    required this.tabooWords,
  });

  final List<String> tabooWords;
  @override
  Widget build(BuildContext context) {
    return ListView(
      
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: tabooWords
            .map(
              (tabooWord) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  tabooWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
            .toList());
  }
}
