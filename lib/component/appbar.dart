import 'package:flutter/material.dart';
import 'package:tictactoe/pages/gamepage.dart';

class MyAppbar extends StatelessWidget implements PreferredSize {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              obj.restartColour();
              obj.restartgame();
              obj.score2.value = 0;
              obj.score1.value = 0;
              obj.colourSetter.value = true;
              obj2.colourSetter2.value = false;
            },
            icon: const Icon(Icons.delete))
      ],
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      title: const Text(
        'TicTacToe',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
