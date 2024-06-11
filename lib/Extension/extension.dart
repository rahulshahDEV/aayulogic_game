import 'package:flutter/material.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

extension MyGame on BuildContext {
  void showSnackBar(String message, {int myduration = 360}) {
    !obj.checkAutoBot
        ? ScaffoldMessenger.of(this).showSnackBar(SnackBar(
            action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  ScaffoldMessenger.of(this).removeCurrentSnackBar();
                }),
            duration: Duration(milliseconds: myduration),
            content: Text(message)))
        : "";
  }

  void pushMethod(Widget nextPage) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => nextPage,
    ));
  }

  void popMethod() {
    Navigator.pop(this);
  }
}

extension MyExtension on String {
  String? validateIsEmpty() {
    if (this.toString().isEmpty) {
      return 'required';
    }
    return null;
  }
}
