import 'package:flutter/material.dart';
import 'package:magic_app/listener/player_health.dart';
import 'package:magic_app/listener/shield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PlayerEnum {
  blue(1, "1", Colors.blue),
  pink(2, "2", Colors.pink),
  green(3, "3", Colors.green),
  yellow(4, "4", Colors.orange),
  grey(5, "5", Colors.grey);

  const PlayerEnum(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
// Load and obtain the shared preferences for this app.
  final prefs = SharedPreferences.getInstance();
  int playerNumbers = 0;

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
                padding: const EdgeInsets.only(top: 20.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                child: Row(
                  children: [
                    const Text('Players', style: TextStyle(fontSize: 20)),
                    const Spacer(),
                    SizedBox(
                      child: DropdownMenu<PlayerEnum>(
                        initialSelection: PlayerEnum.values[1],
                        enableFilter: false,
                        requestFocusOnTap: true,
                        leadingIcon: const Icon(Icons.group),
                        label: const Text('Players'),
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        onSelected: (player) {
                          setState(() {
                            playerNumbers = player?.value ?? 1;
                          });
                        },
                        dropdownMenuEntries: PlayerEnum.values
                            .map<DropdownMenuEntry<PlayerEnum>>(
                                (PlayerEnum player) {
                          return DropdownMenuEntry<PlayerEnum>(
                            value: player,
                            label: player.label,
                            enabled: player.label != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: player.color,
                            ),
                          );
                        }).toList(),
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
