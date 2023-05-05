import 'package:flutter/material.dart';

/*
  - This widget will be showns in @EndScreen.
  - It shows the Team name and team score in a List Tile
*/

class TeamScoreTile extends StatelessWidget {
  const TeamScoreTile({
    super.key,
    required this.teamName,
    required this.teamScore,
  });

  final String teamName;
  final String teamScore;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.all(8.0),
      tileColor: Theme.of(context).canvasColor,
      title: Text(
        // Team name
        teamName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.deepPurple.shade900,
            ),
      ),
      trailing: Row(
        // Team Score
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Skor : ",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.deepPurple.shade900, fontStyle: FontStyle.normal),
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            foregroundColor: Colors.deepPurple.shade900,
            child: Text(
              teamScore,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
