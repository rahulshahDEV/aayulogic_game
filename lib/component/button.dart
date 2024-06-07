import 'package:flutter/material.dart';
import 'package:tictactoe/pages/gamepage.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.player, required this.colour});

  final String player;
  final bool colour;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obj.colourSetter,
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
              // obj.playerSwitch();
              print(player);
              final res = obj.setPlayer('X');

              if (res) {
                print('from snackbar');
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Player dkfj')));
              }
            } else if (player == 'O') {
              final res = obj.setPlayer('O');
              obj.buttonSwitch();
              if (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Player O Activated')));
              }
            } else {
              print('error occured');
            }
          },
          icon: const Icon(Icons.person),
          label: Text('Player-$player')),
    );
  }
}
