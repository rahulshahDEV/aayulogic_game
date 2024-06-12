import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyModel {
  int userIndex = 0;
  bool checkAutoBot = false;
  String playerO = 'player O';
  String playerX = 'Player X';
  String player = 'O';
  ValueNotifier<List> occupied =
      ValueNotifier<List>(["", "", "", "", "", "", "", "", ""]);
  List<int> matchedBoxes = [];
  ValueNotifier<double> turn = ValueNotifier<double>(0.0);
  bool gameEnd = false;

  ValueNotifier<bool> level = ValueNotifier<bool>(true);

  // bool endGame = false;
  ValueNotifier<bool> endGame = ValueNotifier<bool>(true);
  ValueNotifier<int> score1 = ValueNotifier<int>(0);
  ValueNotifier<int> score2 = ValueNotifier<int>(0);
  ValueNotifier<bool> colourSetter = ValueNotifier<bool>(true);
  ValueNotifier<bool> colourSetter2 = ValueNotifier<bool>(false);

  void setPlayers(String p1, String p2) {
    this.playerO = p1;
    this.playerX = p2;
  }

  void setColour() {
    colourSetter.value = !colourSetter.value;
  }

  void setColour2() {
    colourSetter2.value = !colourSetter2.value;
  }

  bool get myColour => colourSetter.value;

  bool get myColour1 => colourSetter2.value;

  String get currentPlayer => player;

  List get myOccoupied => occupied.value;

  bool setPlayer(String player) {
    this.player = player;
    return true;
  }
}
