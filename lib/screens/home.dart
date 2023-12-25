import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:magic_app/counter.dart';
import 'package:magic_app/menu.dart';
import 'package:magic_app/listener/player_health.dart';
import 'dart:math';

import 'package:magic_app/screens/settings.dart';
import 'package:magic_app/widgets/navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color counterColor = Color(0xFF63AB77);
  Color counterColor1 = Color(0xFF8F2222);
  bool showMenu = false;
  bool _extraCountersMenu = false;
  bool _showAppBar = false;
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
              title: const Text('Magic Life Counter'),
              backgroundColor: Colors.green.shade200,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            )
          : null,
      body: Stack(
        children: [
          Center(child: Text("Hallo Home Screen")),
        ],
      ),
    );
  }
}
