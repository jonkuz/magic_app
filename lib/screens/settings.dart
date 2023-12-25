import 'package:flutter/material.dart';
import 'package:magic_app/listener/player_health.dart';
import 'package:magic_app/listener/shield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
// Load and obtain the shared preferences for this app.
  final prefs = SharedPreferences.getInstance();

// Save the counter value to persistent storage under the 'counter' key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Player health', style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      obscureText: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Player health',
                      ),
                      onSubmitted: (value) async {
                        context.read<PlayerHealth>().health = int.parse(value);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setInt('playerHealth', int.parse(value));
                      },
                      controller: TextEditingController(
                          text:
                              context.watch<PlayerHealth>().health.toString()),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    const Text('Shield', style: TextStyle(fontSize: 20)),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        obscureText: false,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Shield value',
                        ),
                        onSubmitted: (value) async {
                          context.read<Shield>().shield = int.parse(value);
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setInt('shield', int.parse(value));
                        },
                        controller: TextEditingController(
                            text: context.watch<Shield>().shield.toString()),
                      ),
                    )
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
