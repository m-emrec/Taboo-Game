import 'package:flutter/material.dart';
import 'package:taboo/utils/taboo_words_section.dart';


class WordsCard extends StatelessWidget {
  const WordsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Word",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).primaryColor,
          ),
          const TabooWordsSection(),
        ],
      ),
    );
  }
}