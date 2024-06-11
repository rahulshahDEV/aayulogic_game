import 'package:flutter/material.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({super.key, required this.winner, this.check = true});

  final String winner;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(actions: [
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
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: check ? Colors.green : Colors.red,
                  child: Icon(
                    check ? Icons.check : Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: check
                      ? Text('Player $winner won !')
                      : const Text('Game Drawn'),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: WidgetStateColor.resolveWith(
                        (states) => Colors.deepPurple,
                      ),
                      foregroundColor: WidgetStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    if (obj.colourSetter2.value) {
                      controller.switchBtoA();
                    }
                    controller.alertBox(context);
                  },
                  child: const Text(' play again '))
            ],
          ),
        ]),
      ),
    ]);
  }
}
