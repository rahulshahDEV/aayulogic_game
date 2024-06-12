import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/Extension/extension.dart';
import 'package:tictactoe/views/component/alertbox.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

class MyController {
  void restartFully() {
    restartgame();
    restartScore();
    obj.colourSetter.value = true;
    obj.colourSetter2.value = false;
    obj.playerO = 'Player O';
    obj.playerX = 'Player X';
    obj.turn.value = 0.0;
    obj.player = 'O';
  }

  void rotateButton() {
    obj.turn.value += 1 / 2;
    if (obj.colourSetter2.value) {
      switchAtoB();
    }
    restartgame();
    obj.player = 'O';
  }

  int genIndex() {
    int randomIndex = (Random().nextInt(8)).abs();
    return randomIndex;
  }

  bool checkBoxisFilled(int index) {
    if (obj.occupied.value[index].toString().isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void autoDataHandler(int index) {
    setOccoupied(index, check: true);
    playerSwitch();
  }

  void callHuman(int index) {
    setOccoupied(index);
    autoBot();
    obj.userIndex = index;
  }

  int bestIndexChoice() {
    List<int> indexes = [4, 8, 2, 4, 0, 2, 6, 8];

    for (var index in indexes) {
      if (obj.occupied.value[index].toString().isEmpty) {
        return index;
      }
    }
    return genIndex();
  }

  void autoBot() {
    if (obj.level.value) {
      Future.delayed(const Duration(milliseconds: 190), () {
        int index = genIndex();
        final boxIsFilled = checkBoxisFilled(index);
        // print(obj.occupied.value[index]);
        if (boxIsFilled) {
          autoDataHandler(index);
          validation(mycontext);
        } else if (!filledBox() && isModifiable()) {
          autoBot();
        }
      });
    } else {
      print(bestIndexChoice());
      Future.delayed(const Duration(milliseconds: 190), () {
        int index = bestIndexChoice();
        final boxIsFilled = checkBoxisFilled(index);
        // print(obj.occupied.value[index]);
        if (boxIsFilled) {
          autoDataHandler(index);
          validation(mycontext);
        } else if (!filledBox() && isModifiable()) {
          autoBot();
        }
      });
    }
  }

  void restartScore() {
    obj.score2.value = 0;
    obj.score1.value = 0;
  }

  String setButtonText(String playerName) {
    return playerName;
  }

  void restartColour() {
    obj.matchedBoxes = [];
  }

  void restartgame() {
    obj.player = 'O';
    restartColour();
    obj.occupied.value = ["", "", "", "", "", "", "", "", ""];
    obj.occupied.value = List.from(obj.occupied.value);
  }

  void pushDataToBox(int index) {
    obj.occupied.value[index] = obj.currentPlayer;
    obj.occupied.value = List.from(obj.occupied.value);
  }

  void setOccoupied(int index, {bool check = false}) {
    if (check) {
      try {
        pushDataToBox(index);
      } catch (e) {
        mycontext!.showSnackBar(e.toString());
      }
    } else {
      try {
        pushDataToBox(index);
      } catch (e) {
        mycontext!.showSnackBar(e.toString());
      }
    }
  }

  bool isModifiable() {
    try {
      obj.occupied.value.add(null);
      return true;
    } on UnsupportedError {
      return false;
    }
  }

  void setScore(String val) {
    var myValue = obj.occupied.value;
    obj.occupied.value = List.unmodifiable(myValue);
    if (val == 'X') {
      obj.score1.value++;
    } else if (val == 'O') {
      obj.score2.value++;
    }
  }

  void switchAtoB() {
    obj.setColour();
    obj.setColour2();
  }

  void switchBtoA() {
    obj.setColour2();
    obj.setColour();
  }

  void buttonSwitch() {
    if (obj.player == 'O') {
      switchBtoA();
    } else if (obj.player == 'X') {
      switchAtoB();
    }
  }

  void playerSwitch() {
    if (obj.player == 'O') {
      obj.player = 'X';
      switchBtoA();
    } else if (obj.player == 'X') {
      obj.player = 'O';
      switchAtoB();
    }
  }

  bool filledBox() {
    int res = obj.myOccoupied
        .where(
          (element) => element == 'X' || element == 'O',
        )
        .length;
    return res == 9;
  }

  void alertBox(var context) {
    Navigator.pop(context);
    restartgame();
    restartColour();
    // if (obj.colourSetter.value) {
    //   switchAtoB();
    // }
  }

  bool validation(context) {
    if (obj.myOccoupied[0] == obj.myOccoupied[1] &&
        obj.myOccoupied[1] == obj.myOccoupied[2] &&
        obj.myOccoupied[0] != '') {
      obj.setColour();

      controller.setScore(obj.myOccoupied[0]);

      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[0]));
      obj.matchedBoxes.addAll([0, 1, 2]);
    } else if (obj.myOccoupied[3] == obj.myOccoupied[4] &&
        obj.myOccoupied[4] == obj.myOccoupied[5] &&
        obj.myOccoupied[3] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[3]));
      controller.setScore(obj.myOccoupied[3]);
      obj.matchedBoxes.addAll([3, 4, 5]);
    } else if (obj.myOccoupied[6] == obj.myOccoupied[7] &&
        obj.myOccoupied[6] == obj.myOccoupied[8] &&
        obj.myOccoupied[6] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[6]));
      obj.matchedBoxes.addAll([6, 7, 8]);
      controller.setScore(obj.myOccoupied[6]);
    } else if (obj.myOccoupied[0] == obj.myOccoupied[3] &&
        obj.myOccoupied[0] == obj.myOccoupied[6] &&
        obj.myOccoupied[0] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[0]));
      obj.matchedBoxes.addAll([6, 0, 3]);
      controller.setScore(obj.myOccoupied[0]);
    } else if (obj.myOccoupied[1] == obj.myOccoupied[4] &&
        obj.myOccoupied[4] == obj.myOccoupied[7] &&
        obj.myOccoupied[1] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[1]));
      obj.matchedBoxes.addAll([1, 4, 7]);
      controller.setScore(obj.myOccoupied[4]);
    } else if (obj.myOccoupied[2] == obj.myOccoupied[5] &&
        obj.myOccoupied[5] == obj.myOccoupied[8] &&
        obj.myOccoupied[2] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[2]));
      obj.matchedBoxes.addAll([2, 5, 8]);
      controller.setScore(obj.myOccoupied[2]);
    } else if (obj.myOccoupied[2] == obj.myOccoupied[4] &&
        obj.myOccoupied[4] == obj.myOccoupied[6] &&
        obj.myOccoupied[2] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[2]));
      obj.matchedBoxes.addAll([2, 4, 6]);
      controller.setScore(obj.myOccoupied[4]);
    } else if (obj.myOccoupied[0] == obj.myOccoupied[4] &&
        obj.myOccoupied[4] == obj.myOccoupied[8] &&
        obj.myOccoupied[0] != '') {
      showDialog(
          context: context,
          builder: (context) => MyAlert(winner: obj.occupied.value[0]));

      controller.setScore(obj.myOccoupied[4]);
      obj.matchedBoxes.addAll([4, 0, 8]);
    } else if (controller.filledBox()) {
      showDialog(
          context: context,
          builder: (context) => const MyAlert(
                winner: 'x',
                check: false,
              ));
    }
    return false;
  }
}
