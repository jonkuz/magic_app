import 'package:flutter/material.dart';
import 'package:magic_app/counter.dart';
import 'package:magic_app/menu.dart';
import 'dart:math';

import 'package:magic_app/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  bool _showAppBar = true;
  Color counterColor = Colors.green.shade200;
  Color counterColor1 = Colors.red.shade200;
  bool showMenu = false;
  bool _extraCountersMenu = false;

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
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(180 / 360),
                  child: Counter(
                    counterColor,
                    counter,
                  ),
                ),
              ),
              Expanded(
                child: Counter(counterColor1, counter),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.grey.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.grey.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  // Add your onPressed logic here
                  //_setCounter(40);
                  //_counterColor = Colors.amber;
                  Navigator.pushNamed(context, '/settings');
                },
                child: const Icon(Icons.settings_outlined),
              ),
            ),
          ),
          Visibility(
            visible: showMenu,
            child: Stack(
              children: [
                Positioned(
                  top: 350,
                  left: 230,
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsPage()));
                        },
                        child: const Icon(
                          Icons.settings,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 310,
                  left: 315,
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            counter = 40;
                          });
                        },
                        child: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 430,
                  left: 230,
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            counterColor = generateRandomColor();
                            counterColor1 = generateRandomColor();
                          });
                        },
                        child: const Icon(Icons.palette),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 485,
                  left: 315,
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            counterColor = Colors.white;
                            counterColor1 = Colors.white;
                            counter = 0;
                          });
                        },
                        child: const Icon(Icons.restore),
                      )
                    ],
                  ),
                ),
                if (_extraCountersMenu)
                  Positioned(
                      top: 300,
                      left: 300,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                counter = 0;
                              });
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
    );
  }
}
