import 'package:flutter/material.dart';
import 'package:magic_app/home.dart';
import 'package:magic_app/menu.dart';
import 'package:magic_app/screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/menu': (context) => const Menu(),
      },
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
