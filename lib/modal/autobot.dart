import 'dart:math';

class AutoBot {
  bool checkUser(var val) {
    if (val == true) {
      return true;
    } else {
      return false;
    }
  }

  String? checkTurn(var player) {
    if (player == 'X') {
      return 'X';
    } else if (player == 'O') {
      return 'O';
    } else {
      return null;
    }
  }

  int genIndex() {
    int randomIndex = (Random().nextInt(9) - 1).abs();
    return randomIndex;
  }

  void checkEmptyIndex() {
    // for(var data in obj.)
  }
}
