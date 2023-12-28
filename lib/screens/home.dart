import 'package:flutter/material.dart';
import 'package:magic_app/database/database_helper.dart';

import 'package:magic_app/database/player.dart';
import 'dart:math';
import '../assets/constants.dart' as constants;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
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
      appBar: AppBar(
        title: const Text('Magic Life Counter'),
        forceMaterialTransparency: false,
        backgroundColor: constants.ACCENT_COLOR1,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Player>>(
        future: DatabaseHelper().players(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No players available.'));
          } else {
            return DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Active')),
                DataColumn(label: Text('Health')),
                DataColumn(label: Text('Shield')),
                DataColumn(label: Text('Commander Damage')),
                DataColumn(label: Text('Color')),
              ],
              rows: snapshot.data!.map((player) {
                return DataRow(
                  cells: [
                    DataCell(Text(
                        player.id.toString())), // New DataCell for 'active'
                    DataCell(Text(player.name)),
                    DataCell(
                        Checkbox(
                          value: player.active == "true" ? true : false,
                          onChanged: (value) async {
                            player.active = value.toString();
                            await DatabaseHelper().updatePlayer(player);
                            setState(() {});
                          },
                        ), onTap: () async {
                      player.active =
                          player.active == "true" ? "false" : "true";
                      await DatabaseHelper().updatePlayer(player);
                      setState(() {});
                    }),
                    DataCell(Text(player.health.toString())),
                    DataCell(Text(player.shield.toString())),
                    DataCell(Text(player.commanderDamage.toString())),
                    DataCell(Text(player.color)),
                  ],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
