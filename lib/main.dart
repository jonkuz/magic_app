import 'package:flutter/material.dart';
import 'package:magic_app/listener/shield.dart';
import 'package:magic_app/screens/counter_screen.dart';
import 'package:magic_app/menu.dart';
import 'package:magic_app/listener/player_health.dart';
import 'package:magic_app/screens/home.dart';
import 'package:magic_app/screens/life_counter.dart';
import 'package:magic_app/screens/settings.dart';
import 'package:magic_app/widgets/navigationbar.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerHealth(),
      child: ChangeNotifierProvider(
        create: (context) => Shield(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: const Color(0xFF457350),
    );

    final textTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        );

    final textThemeDark = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/menu': (context) => const Menu(),
        '/counter': (context) => const LifeCounter(),
      },
      home: Scaffold(
        body: HomeScreen(),
        bottomNavigationBar: BottomNavigationBarExample(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: textTheme,
        colorScheme: colorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF313640),
          foregroundColor: Color(0xFF65BF7C),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF313640),
          foregroundColor: Color(0xFF65BF7C),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: textThemeDark,
        colorScheme: colorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF313640),
          foregroundColor: Color(0xFF65BF7C),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF313640),
          foregroundColor: Color(0xFF65BF7C),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
