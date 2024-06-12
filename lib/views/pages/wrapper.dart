import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictactoe/Extension/extension.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

import 'package:tictactoe/views/pages/homescreen.dart';
import 'package:tictactoe/views/pages/level.dart';
import 'package:tictactoe/views/pages/multiplayer.dart';

class MyWrapper extends StatelessWidget {
  const MyWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'TIC TAC TOE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/images.png'),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          myContainer(FontAwesomeIcons.userLarge, FontAwesomeIcons.robot,
              context, const Level(),
              checkAutoBot: true),
          myContainer(FontAwesomeIcons.userLarge, FontAwesomeIcons.userLarge,
              context, Wrapper())
        ],
      ),
    );
  }

  Widget myContainer(
      IconData icon, IconData icons, BuildContext context, Widget mywidget,
      {bool checkAutoBot = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {
          obj.checkAutoBot = checkAutoBot;
          context.pushMethod(mywidget);
        },
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.deepPurple,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'VS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                icons,
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
