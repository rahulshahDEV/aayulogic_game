// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tictactoe/modal/mymodel.dart';

MyModel obj = MyModel();
MyModel obj2 = MyModel();

class MyGame extends StatefulWidget {
  const MyGame({
    super.key,
    required this.player,
    required this.index,
  });

  final String player;
  final int index;

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.deepPurple,
        radius: 900,
        onTap: () {
          HapticFeedback.vibrate();
          if ((obj.myOccoupied[widget.index]).toString().isEmpty &&
              obj.isModifiable()) {
            obj.setOccoupied(widget.index);
            obj.playerSwitch();
            obj.validation(context);
          }

          print(obj.myOccoupied[widget.index]);
        },
        child: ValueListenableBuilder(
            valueListenable: obj.occupied,
            builder: (context, value, _) {
              return Container(
                decoration: BoxDecoration(
                    color: obj.matchedBoxes.contains(widget.index)
                        ? Colors.green
                        : Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(value[widget.index],
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: value[widget.index] == 'O'
                              ? Colors.white
                              : Colors.yellow)),
                ),
              );
            }),
      ),
    );
  }
}
