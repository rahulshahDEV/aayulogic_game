import 'package:flutter/material.dart';
import 'package:tictactoe/component/appbar.dart';
import 'package:tictactoe/component/button.dart';
import 'package:tictactoe/component/button2.dart';
import 'package:tictactoe/pages/gamepage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppbar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => MyGame(
                    player: obj.occupied.value[index],
                    index: index,
                  ),
                  itemCount: 9,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      child: const Text(
                        'Score :',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: obj.score2,
                      builder: (context, value, child) => Text(
                        value.toString(),
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      child: const Text(
                        'Score : ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: obj.score1,
                      builder: (context, value, child) => Text(
                        value.toString(),
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButton(
                      player: 'O',
                      colour: obj.myColour,
                    ),
                    MyButton2(
                      player: 'X',
                      colour: obj.myColour1,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
