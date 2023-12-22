import 'dart:async';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Color backgroundColor;
  int counter;

  Counter(this.backgroundColor, this.counter, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
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
      setState(() {
        lastChange = 0;
        visible = false;
      });
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
      color: c,
      width: MediaQuery.of(context).size.width, // Set the background color here
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const Positioned(
                  top: 50,
                  left: 10,
                  child: Row(
                    children: [],
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Positioned(
                    width: 30,
                    left: MediaQuery.of(context).size.width / 2 - 15,
                    top: 75,
                    child: Text('$lastChange',
                        style: TextStyle(
                            fontSize: 24,
                            color: add ? Colors.green : Colors.red)),
                  ),
                ),
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
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  iconColor: Colors.black,
                                  // foreground
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.counter--;
                                    lastChange--;
                                    visible = true;
                                    add = false;
                                  });

                                  _resetTimer();
                                },
                                child: const Icon(Icons.remove, size: 40)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '$i',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'RobotoMono'),
                        ),
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                          iconColor: Colors.black,
                          // foreground
                        ),
                        onPressed: () {
                          setState(() {
                            widget.counter++;
                            lastChange++;
                            visible = true;
                            add = true;
                          });
                          _resetTimer();
                        },
                        child: const Icon(Icons.add, size: 40)),
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
