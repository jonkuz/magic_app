class Player {
  final int id;
  String name;
  String active;
  int health;
  int shield;
  int commanderDamage;
  String color;

  Player({
    required this.id,
    required this.name,
    required this.active,
    required this.health,
    required this.shield,
    required this.commanderDamage,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'active': active,
      'health': health,
      'shield': shield,
      'commanderDamage': commanderDamage,
      'color': color,
    };
  }

  @override
  String toString() {
    return 'Player{id: $id, name: $name, active: $active, health: $health, shield: $shield, commanderDamage: $commanderDamage, color: $color}';
  }
}
