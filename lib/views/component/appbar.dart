import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

class MyAppbar extends StatelessWidget implements PreferredSize {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(FontAwesomeIcons.circleArrowLeft)),
      actions: [
        IconButton(
            onPressed: () {
              controller.restartFully();
              obj.player = 'O';
            },
            icon: const Icon(FontAwesomeIcons.powerOff))
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
