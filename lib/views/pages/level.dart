import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictactoe/Extension/extension.dart';
import 'package:tictactoe/views/pages/gamepage.dart';
import 'package:tictactoe/views/pages/homescreen.dart';
import 'package:tictactoe/views/pages/multiplayer.dart';

class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                  top: -20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      'Difficulty',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ValueListenableBuilder(
                  valueListenable: obj.level,
                  builder: (context, value, child) => Column(
                    children: [
                      Icon(
                        value
                            ? FontAwesomeIcons.solidFaceSmileBeam
                            : FontAwesomeIcons.solidFaceLaughSquint,
                        size: 100,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      myButton('- Easy -', 0),
                      myButton('- Hard -', 1),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (obj.level.value) {
                              context.pushMethod(const HomeScreen());
                            } else if (!obj.level.value) {
                              context.pushMethod(const HomeScreen());
                            }
                          },
                          child: Text('play'))
                      // myButton('Submit', 2, context)
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 40,
                  child: IconButton(
                      onPressed: () {
                        context.popMethod();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.red,
                      )))
            ],
          )
        ],
      ),
    );
  }

  ElevatedButton myButton(String level, int userChoice) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
              (states) => Colors.deepPurple,
            ),
            foregroundColor: WidgetStateColor.resolveWith(
              (states) => Colors.white,
            ),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
        onPressed: () {
          if (userChoice == 0) {
            obj.level.value = true;
          } else if (userChoice == 1) {
            obj.level.value = false;
          }
        },
        child: Text(level));
  }
}
