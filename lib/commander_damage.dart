import 'dart:async';
import 'package:flutter/material.dart';
import '../assets/constants.dart' as constants;

class CommanderDamage extends StatefulWidget {
  Color backgroundColor;
  int counter;

  CommanderDamage(this.backgroundColor, this.counter, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommanderDamageState createState() => _CommanderDamageState();
}

class _CommanderDamageState extends State<CommanderDamage> {
  Color background = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = widget.counter;
    Color c = widget.backgroundColor;
    return Container(
      color: c,
      width: MediaQuery.of(context).size.width,
      height: 75, // Set the background color here
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.counter--;
                                  });
                                },
                                child: const Icon(Icons.remove, size: 30)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.health_and_safety_outlined,
                                size: 40, color: constants.primaryColor),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                '$i',
                                style: const TextStyle(
                                    fontSize: 40, fontFamily: 'RobotoMono'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            widget.counter++;
                          });
                        },
                        child: const Icon(Icons.add, size: 30)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
