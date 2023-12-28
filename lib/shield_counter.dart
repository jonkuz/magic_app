import 'dart:async';
import 'package:flutter/material.dart';
import '../assets/constants.dart' as constants;

class ShieldCounter extends StatefulWidget {
  Color backgroundColor;
  int counter;

  ShieldCounter(this.backgroundColor, this.counter, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShieldCounterState createState() => _ShieldCounterState();
}

class _ShieldCounterState extends State<ShieldCounter> {
  late Timer _timer;

  bool visible = false;
  int lastChange = 0;

  Color background = Colors.white;

  bool add = false;

  @override
  void initState() {
    super.initState();

    // Set the initial timer
    _startTimer();
  }

  void _startTimer() {
    // Reset x to 0 after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      try {
        setState(() {
          lastChange = 0;
          visible = false;
        });
      } catch (e) {
        print("Error cause timer ended but not longer on life counter screen");
      }
    });
  }

  void _resetTimer() {
    // Cancel the existing timer and start a new one
    _timer.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    int i = widget.counter;
    Color c = widget.backgroundColor;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75, // Set the background color here
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                                    lastChange--;
                                    visible = true;
                                    add = false;
                                  });

                                  _resetTimer();
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
                            const Icon(Icons.shield_outlined,
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
                            lastChange++;
                            visible = true;
                            add = true;
                          });
                          _resetTimer();
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
