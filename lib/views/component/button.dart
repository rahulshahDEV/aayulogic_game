import 'package:flutter/material.dart';
import 'package:tictactoe/Extension/extension.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.player,
      required this.colour,
      required this.playerName});

  final String player;
  final bool colour;
  final String playerName;

  void myButtonLogic(BuildContext context) {
    if (player == 'X') {
      final res = obj.setPlayer('X');

      if (res) {
        context.showSnackBar('player ${obj.playerX} activated', myduration: 5);
      }
    } else if (player == 'O') {
      final res = obj.setPlayer('O');
      controller.buttonSwitch();
      if (res) {
        context.showSnackBar('player ${obj.playerO} activated', myduration: 5);
      }
    } else {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colour ? obj.colourSetter : obj.colourSetter2,
      builder: (context, value, child) => ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith(
                (states) => value ? Colors.green : Colors.deepPurple,
              ),
              foregroundColor: WidgetStateColor.resolveWith(
                (states) => Colors.white,
              ),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)))),
          onPressed: () {
            myButtonLogic(context);
          },
          icon: const Icon(Icons.person),
          label:
              playerName.isEmpty ? Text('Player-$player') : Text(playerName)),
    );
  }
}
