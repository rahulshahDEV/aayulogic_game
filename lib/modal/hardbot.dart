import 'dart:math';

import 'package:tictactoe/views/pages/gamepage.dart';

class HardAutoBot {
  void hardLevelBot() {
    int index = 8;
    var myArray = obj.occupied.value;
    if (myArray.length > 2) {
      for (int i = 0; i < myArray.length; i++) {
        if (myArray[0].toString().isEmpty) {
          index = max(index, i);
        }
      }
    }
  }
}
