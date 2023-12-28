import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:magic_app/database/player.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'magic.db'),
      onCreate: _onCreate,
      version: 2,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    print("on create called");
    db.execute(
      'DROP TABLE IF EXISTS player',
    );
    db.execute(
      'CREATE TABLE IF NOT EXISTS player(id INTEGER PRIMARY KEY ASC, name TEXT, active TEXT, health INTEGER, shield INTEGER, commanderDamage INTEGER, color TEXT)',
    );
    db.execute(
        'INSERT INTO player (name, active, health, shield, commanderDamage, color) VALUES ("Player 1", "true", 40, 0, 0, "blue")');
    db.execute(
        'INSERT INTO player (name, active, health, shield, commanderDamage, color) VALUES ("Player 2", "true", 40, 0, 0, "red")');
    db.execute(
        'INSERT INTO player (name, active, health, shield, commanderDamage, color) VALUES ("Player 3", "true", 40, 0, 0, "yellow")');
    db.execute(
        'INSERT INTO player (name, active, health, shield, commanderDamage, color) VALUES ("Player 4", "true", 40, 0, 0, "green")');
    db.execute(
        'INSERT INTO player (name, active, health, shield, commanderDamage, color) VALUES ("Player 5", "true", 40, 0, 0, "pink")');
  }

  Future<void> insertPlayer(Player player) async {
    final db = await database;
    await db.insert(
      'player',
      player.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Player>> players() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('player');

    return List.generate(maps.length, (i) {
      return Player(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        active: maps[i]['active'] as String,
        health: maps[i]['health'] as int,
        shield: maps[i]['shield'] as int,
        commanderDamage: maps[i]['commanderDamage'] as int,
        color: maps[i]['color'] as String,
      );
    });
  }

  Future<void> updatePlayer(Player player) async {
    final db = await database;
    await db.update(
      'player',
      player.toMap(),
      where: 'id = ?',
      whereArgs: [player.id],
    );
  }

  Future<void> deletePlayer(int id) async {
    final db = await database;
    await db.delete(
      'player',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
