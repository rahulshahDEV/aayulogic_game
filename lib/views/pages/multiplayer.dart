import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictactoe/Extension/extension.dart';
import 'package:tictactoe/views/pages/gamepage.dart';

import 'package:tictactoe/views/pages/homescreen.dart';

class Wrapper extends StatefulWidget {
  Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  InputDecoration myTextfield(String data) {
    return InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: data.toUpperCase());
  }

  final c1 = TextEditingController();

  final c2 = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    c1.dispose();
    c2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Form(
          key: formkey,
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    FontAwesomeIcons.gamepad,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                TextFormField(
                  validator: (value) => value?.validateIsEmpty(),
                  controller: c1,
                  decoration: myTextfield('Player O'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) => value?.validateIsEmpty(),
                  controller: c2,
                  decoration: myTextfield('Player X'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          obj.setPlayers(c1.text, c2.text);
                          context.pushMethod(const HomeScreen());
                        }
                      },
                      child: const Text('submit'),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
