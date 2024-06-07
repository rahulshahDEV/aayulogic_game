import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:tictactoe/pages/gamepage.dart';

class MyModel {
  String player = 'O';
  ValueNotifier<List> occupied =
      ValueNotifier<List>(["", "", "", "", "", "", "", "", ""]);
  List<int> matchedBoxes = [];
  bool gameEnd = false;

  // bool endGame = false;
  ValueNotifier<bool> endGame = ValueNotifier<bool>(true);
  ValueNotifier<int> score1 = ValueNotifier<int>(0);
  ValueNotifier<int> score2 = ValueNotifier<int>(0);
  ValueNotifier<bool> colourSetter = ValueNotifier<bool>(true);
  ValueNotifier<bool> colourSetter2 = ValueNotifier<bool>(false);

  void setColour() {
    colourSetter.value = !colourSetter.value;
  }

  void restartColour() {
    matchedBoxes = [];
  }

  void setColour2() {
    colourSetter2.value = !colourSetter2.value;
  }

  bool get myColour => colourSetter.value;

  bool get myColour1 => colourSetter2.value;

  void restartgame() {
    occupied.value = ["", "", "", "", "", "", "", "", ""];
    occupied.value = List.from(occupied.value);
  }

  bool isModifiable() {
    try {
      occupied.value.add(null); // Or any other modification operation
      return true; // If no exception is thrown, it's modifiable
    } on UnsupportedError {
      return false; // If an UnsupportedError is thrown, it's unmodifiable
    }
  }

  void changeBoxColour() {
    colourSetter.value = !colourSetter.value;
  }

  AlertDialog myalert(context, var winner) {
    return AlertDialog(
      actions: [
        SizedBox(
          height: 200,
          child: Stack(children: [
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel))),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text('Player $winner won !'),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            WidgetStateProperty.all(const EdgeInsets.all(8)),
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.deepPurple,
                        ),
                        foregroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.white,
                        ),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                      obj.restartgame();
                      obj.restartColour();
                    },
                    child: const Text('play again'))
              ],
            ),
          ]),
        )
      ],
    );
  }

  String get currentPlayer => player;

  void setScore(String val) {
    var myValue = occupied.value;
    occupied.value = List.unmodifiable(myValue);
    for (var data in myValue) {
      if (data == '' || data != '') {}
    }
    if (val == 'X') {
      score1.value++;
    } else if (val == 'O') {
      score2.value++;
    }
  }

  bool filledBox() {
    var res = myOccoupied
        .where(
          (element) => element == 'X' || element == 'O',
        )
        .length;
    if (res == 9) {
      return true;
    }
    return false;
  }

  void buttonSwitch() {
    if (player == 'O') {
      // player = 'X';
      obj2.setColour2();
      obj.setColour();
      // obj.setColour();
    } else if (player == 'X') {
      // player = 'O';
      obj.setColour();
      obj2.setColour2();
      // obj.setColour();

      // obj2.setColour();
    }
  }

  void playerSwitch() {
    if (player == 'O') {
      player = 'X';
      obj2.setColour2();
      obj.setColour();
      // obj.setColour();
    } else if (player == 'X') {
      player = 'O';
      obj.setColour();
      obj2.setColour2();
      // obj.setColour();

      // obj2.setColour();
    }
  }

  List get myOccoupied => occupied.value;

  bool setPlayer(String player) {
    this.player = player;
    return true;
  }

  void setOccoupied(int index) {
    try {
      occupied.value[index] = currentPlayer;
      occupied.value = List.from(occupied.value);
    } catch (e) {
      print('error');
    }
  }

  bool validation(context) {
    print(myOccoupied);
    if (myOccoupied[0] == myOccoupied[1] &&
        myOccoupied[1] == myOccoupied[2] &&
        myOccoupied[0] != '') {
      obj.setColour();

      setScore(myOccoupied[0]);
      // print(occupied.value[0]);

      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[0]));
      matchedBoxes.addAll([0, 1, 2]);
      print(matchedBoxes);
      // return true;
    } else if (myOccoupied[3] == myOccoupied[4] &&
        myOccoupied[4] == myOccoupied[5] &&
        myOccoupied[3] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[3]));
      setScore(myOccoupied[3]);
      matchedBoxes.addAll([3, 4, 5]);
      print(myOccoupied);
    } else if (myOccoupied[6] == myOccoupied[7] &&
        myOccoupied[6] == myOccoupied[8] &&
        myOccoupied[6] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[6]));
      matchedBoxes.addAll([6, 7, 8]);
      setScore(myOccoupied[6]);
    } else if (myOccoupied[0] == myOccoupied[3] &&
        myOccoupied[0] == myOccoupied[6] &&
        myOccoupied[0] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[0]));
      matchedBoxes.addAll([6, 0, 3]);
      setScore(myOccoupied[0]);
    } else if (myOccoupied[1] == myOccoupied[4] &&
        myOccoupied[4] == myOccoupied[7] &&
        myOccoupied[1] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[1]));
      matchedBoxes.addAll([1, 4, 7]);
      setScore(myOccoupied[4]);
    } else if (myOccoupied[2] == myOccoupied[5] &&
        myOccoupied[5] == myOccoupied[8] &&
        myOccoupied[2] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[2]));
      matchedBoxes.addAll([2, 5, 8]);
      setScore(myOccoupied[2]);
    } else if (myOccoupied[2] == myOccoupied[4] &&
        myOccoupied[4] == myOccoupied[6] &&
        myOccoupied[2] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[2]));
      matchedBoxes.addAll([2, 4, 6]);
      setScore(myOccoupied[4]);
    } else if (myOccoupied[0] == myOccoupied[4] &&
        myOccoupied[4] == myOccoupied[8] &&
        myOccoupied[0] != '') {
      showDialog(
          context: context,
          builder: (context) => myalert(context, occupied.value[0]));

      setScore(myOccoupied[4]);
      matchedBoxes.addAll([4, 0, 8]);
    } else if (filledBox()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            content: Stack(children: [
          Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  restartgame();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel),
                color: Colors.red,
              )),
          const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'Game drawn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 20),
              ),
            ),
          ),
        ])),
      );
    }
    return false;
  }
}
