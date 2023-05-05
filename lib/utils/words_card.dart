import 'package:flutter/material.dart';
import 'package:taboo/utils/taboo_words_section.dart';

/*
  - This widget contains a word and taboo words of the word.
*/

class WordsCard extends StatelessWidget {
  const WordsCard({
    super.key,
    required this.wordData,
  });

  final Map wordData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              wordData["word"],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Divider(
              thickness: 3,
              color: Theme.of(context).primaryColor,
            ),
            TabooWordsSection(
              tabooWords: wordData["taboos"],
            ),
          ],
        ),
      ),
    );
  }
}
