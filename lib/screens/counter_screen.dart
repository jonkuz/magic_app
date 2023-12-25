import 'package:flutter/material.dart';
import 'package:magic_app/commander_damage.dart';

import 'package:magic_app/counter.dart';

import 'package:magic_app/listener/player_health.dart';
import 'package:magic_app/listener/shield.dart';
import 'package:magic_app/shield_counter.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  bool _showShield = false;
  bool _showCommanderDamage = false;

  CounterScreen(this._showShield, this._showCommanderDamage, {super.key});

  @override
  State<CounterScreen> createState() => _CounterScreen();
}

class _CounterScreen extends State<CounterScreen> {
  Color counterColor = Color(0xFF63AB77);
  Color counterColor1 = Color(0xFF8F2222);
  bool showMenu = false;
  bool _extraCountersMenu = false;
  bool _showAppBar = false;
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
    _showShield = widget._showShield;
    _showCommanderDamage = widget._showCommanderDamage;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    Counter(
                      counterColor1,
                      context.watch<PlayerHealth>().health,
                    ),
                    Visibility(
                      visible: _showShield,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: ShieldCounter(
                            counterColor1, context.watch<Shield>().shield),
                      ),
                    ),
                    Visibility(
                      visible: _showCommanderDamage,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CommanderDamage(
                            counterColor1, CommanderDamageCounter),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
