import 'package:flutter/material.dart';

import 'package:tictactoe/pages/homescreen.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  InputDecoration myTextfield() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      fillColor: Colors.grey,
      filled: true,
      hintText: 'Enter player name',
    );
  }

  final c1 = TextEditingController();
  final c2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: c1,
                decoration: myTextfield(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: c2,
                decoration: myTextfield(),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  child: Text('submit'))
            ],
          ),
        ));
  }
}
