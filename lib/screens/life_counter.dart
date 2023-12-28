import 'package:flutter/material.dart';
import 'package:magic_app/database/database_helper.dart';
import 'package:magic_app/database/player.dart';

import 'package:magic_app/screens/counter_screen.dart';

import 'dart:math';
import '../assets/constants.dart' as constants;

class LifeCounter extends StatefulWidget {
  const LifeCounter({super.key});

  @override
  State<LifeCounter> createState() => _LifeCounterState();
}

class _LifeCounterState extends State<LifeCounter> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Color counterColor = constants.BACKGROUND_COLOR;
  Color counterColor1 = constants.BACKGROUND_COLOR;
  bool showMenu = false;
  bool _extraCountersMenu = false;
  bool _showAppBar = true;
  bool _showShield = false;

  bool _showCommanderDamage = false;

  int CommanderDamageCounter = 0;
  Color generateRandomColor() {
    Random random = Random();
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    return Color.fromRGBO(r, g, b, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: constants.BACKGROUND_COLOR,
            )
          : null,
      body: Container(
        color: counterColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(180 / 360),
                      child: CounterScreen(_showShield, _showCommanderDamage),
                    ),
                  ),
                  Expanded(
                    child: CounterScreen(_showShield, _showCommanderDamage),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Add your onPressed logic here
                      //_setCounter(40);
                      //_counterColor = Colors.amber;
                      setState(() {
                        showMenu = !showMenu;
                      });
                    },
                    child: const Icon(Icons.menu_outlined),
                  ),
                ),
              ),
              Visibility(
                visible: showMenu,
                child: Stack(
                  children: [
                    Positioned(
                      top: 280,
                      left: 230,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _showShield = !_showShield;
                              });
                            },
                            child: const Icon(
                              Icons.shield_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 315,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _showCommanderDamage = !_showCommanderDamage;
                              });
                            },
                            child: const Icon(Icons.health_and_safety_outlined),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 360,
                      left: 230,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Icon(Icons.palette),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 415,
                      left: 315,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              if (MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark) {
                                setState(() {
                                  counterColor = const Color(0xFF313640);
                                  counterColor1 = const Color(0xFF313640);
                                });
                              } else {
                                setState(() {
                                  counterColor = Colors.white;
                                  counterColor1 = Colors.white;
                                });
                              }
                            },
                            child: const Icon(Icons.restore),
                          )
                        ],
                      ),
                    ),
                    if (_extraCountersMenu)
                      Positioned(
                          top: 230,
                          left: 300,
                          child: Stack(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: const Icon(Icons.restore),
                              )
                            ],
                          ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
