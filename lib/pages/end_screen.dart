import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/provider/game_provider.dart';

import '../utils/team_score_tile.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  static const routeName = "end-screen";

  List _sortedList(List<Map> list) {
    List sortedValues =
        []; // an empty list to hold the sorted values of the list<Map>.
    List<Map> sortedMap =
        []; // empty List of Maps to hold the sorted Map items.
    for (var element in list) {
      // add the Score values of list<Map>.
      sortedValues.add(element["teamScore"]);
    }
    sortedValues.sort(); // sort the list.
    for (var i = 0; i < sortedValues.length; i++) {
      // first create a dynamic variable. This varible may be List<Map> or just a Map.
      // then define this variable's value where the @teamScore is equal to the value inside @sortedValues list
      var element = list.where(
          (map) => map["teamScore"] == sortedValues.reversed.toList()[i]);
      // for every element of @element variable add it's value to the @sortedMap
      element.forEach((map) {
        sortedMap.add(map);
      });
    }

    // return @sortedMap
    return sortedMap;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Consumer<Game>(
          builder: (context, game, child) => SizedBox(
            width: size.width * 0.8,
            // Score Table Card
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Title
                    Text(
                      "Skor Tablosu",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      thickness: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    // Teams list
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: game.teamList.length,
                      itemBuilder: (context, index) {
                        final List sortedList = _sortedList(game
                            .teamList); // _sortedList returns a List of Maps.
                        final String teamName = sortedList[index]["teamName"];
                        final String teamScore =
                            sortedList[index]["teamScore"].toString();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TeamScoreTile(
                            teamName: teamName,
                            teamScore: teamScore,
                          ),
                        );
                      },
                    ),
                    // return to Home Page button
                    SizedBox(
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushReplacementNamed("/")
                        },
                        child: const Text("Ana Sayfa"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
