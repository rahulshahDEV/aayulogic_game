import 'package:flutter/material.dart';
import 'package:tictactoe/pages/gamepage.dart';

class MyButton2 extends StatelessWidget {
  MyButton2({super.key, required this.player, required this.colour});

  final String player;
  final bool colour;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obj2.colourSetter2,
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
            if (player == 'X') {
              final res = obj.setPlayer('X');
              obj.buttonSwitch();
              if (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Player X Activated')));
              }
            } else if (player == 'Y') {
              final res = obj.setPlayer('O');
              if (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Player Y Activated')));
              }
            } else {
              throw Exception('error');
            }
          },
          icon: const Icon(Icons.person),
          label: Text('Player-$player')),
    );
  }
}
