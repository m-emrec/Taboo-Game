import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/game_provider.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {

  @override
  void initState() {
    super.initState();
    Provider.of<Game>(context,listen: false).resetGame();
  }

//* Variables
  final List<TextField> _teamNameTextFieldList = [];
  int inputIndex = 0;

//* Widget Functions

  // Custom button widget
  Widget button({
    required VoidCallback onPressed,
    required Widget child,
    required double screenWidth,
  }) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }

// Returns a TextField widget
  TextField _textField(int index) {
    // Create an Unique Key to identify TextFields.
    Key _key = UniqueKey();
    return TextField(
      key: _key,
      decoration: InputDecoration(
        label: const Text("Takım İsmi"),
        suffix: CloseButton(
          color: Colors.deepPurple.shade500,
          onPressed: () => _removeInputField(_key),
        ),
      ),
      controller: TextEditingController(),
    );
  }

//*Functions

  // removes the input field from the list.
  void _removeInputField(Key key) {
    setState(
      () {
        _teamNameTextFieldList.removeWhere((element) => element.key == key);
        inputIndex--;
      },
    ); // set state
  }

  void _addInputField() {
    // if team name list is empty then add TextField to the list
    if (_teamNameTextFieldList.isEmpty) {
      setState(
        () {
          _teamNameTextFieldList.add(
            _textField(inputIndex),
          );

          inputIndex++;
        },
      );
    } else {
      // if it's not empty
      // Check if the TextField is emty or not . İf it is empty then prevent the user adding a new TextField and show a Sncakbar.
      // if it's not empty then add new TextField to the list
      if (_teamNameTextFieldList[inputIndex - 1].controller!.text.isNotEmpty) {
        setState(
          () {
            _teamNameTextFieldList.add(
              _textField(inputIndex),
            );

            inputIndex++;
          },
        );
      } //if
      else {
        const SnackBar snackBar =
            SnackBar(content: Text("Takım İsmi Boş Olamaz !"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } // else
    } // else
  }

  // Adds the team names to the TeamList in GameProvider
  void addTeam(Function func) {
    for (var textField in _teamNameTextFieldList) {
      func(textField.controller!.text);
    }

    widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          //Team name input List
          ..._teamNameTextFieldList.map(
            (TextField textField) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24,
                ),
                child: SizedBox(
                  height: 50,
                  child: textField,
                ),
              );
            },
          ),

          // Add Team button
          button(
            onPressed: () {
              // if there is less than 4 TextField add new one.
              if (inputIndex < 4) {
                _addInputField();
              } else {
                const SnackBar snackBar = SnackBar(
                  content: Text("En Fazla 4 Takım Olabilir !"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text("Takım Ekle"),
            screenWidth: screenWidth,
          ),
          // Continue Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              // if there is 2 or more Team then show Continue Button
              visible: inputIndex > 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Consumer<Game>(
                  builder: (context, game, child) => button(
                    screenWidth: screenWidth * 0.5,
                    onPressed: () => addTeam(game.addTeam),
                    child: const Text("Devam"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
