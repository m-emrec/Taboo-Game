import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboo/pages/end_screen.dart';
import 'package:taboo/provider/game_provider.dart';

//*Definiton
/*
  - This widget pops up to the screen when the Timer reached to 0.
  - Game stops until the players click to Continue button.
  - If there is no round left then @Coninue button will be changed to @end button and when clicked it will navigate to @EndScreen.
*/

class ChangeTeamPopUp extends StatelessWidget {
  const ChangeTeamPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
              ),
            ],
          ),
          width: size.width * 0.7,
          height: size.height * .3,
          child: Consumer<Game>(
            builder: (context, game, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Title
                Text(
                  game.currentTeam["teamName"],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  thickness: 2,
                  color: Theme.of(context).canvasColor,
                ),
                // Skor
                Text(
                  "Skor : ${game.currentTeam["teamScore"]}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // if it is the last round then show @End button
                // if it is not the last round then show @Continue button
                game.roundIndex == game.numberOfRounds &&
                        game.teamIndex == game.teamList.length - 1
                    ? ElevatedButton(
                        // End Button
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          Navigator.of(context)
                              .pushReplacementNamed(EndScreen.routeName);
                        },
                        child: const Text("Bitir"),
                      )
                    : ElevatedButton(
                        // Change Team button
                        onPressed: () {
                          game.changeTeam();

                          Navigator.of(context).pop();
                        },
                        child: const Text("Devam"),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
