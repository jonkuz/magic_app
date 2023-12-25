import 'package:flutter/material.dart';
import 'package:magic_app/screens/card_scanner.dart';
import 'package:magic_app/screens/counter_screen.dart';
import 'package:magic_app/screens/home.dart';
import 'package:magic_app/screens/life_counter.dart';
import 'package:magic_app/screens/settings.dart';
import '../assets/constants.dart' as constants;

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CardScanner(),
    LifeCounter(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: constants.BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'Card Scanner',
            backgroundColor: constants.BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Life Counter',
            backgroundColor: constants.BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: constants.BACKGROUND_COLOR,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: constants.secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
