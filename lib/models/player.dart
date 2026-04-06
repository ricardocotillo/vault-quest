import 'package:decimal/decimal.dart';

class Player {
  final String id;
  final String name;
  final int xp;
  final int level;
  final Decimal stashBalance;
  final List<String> unlockedLoot;
  final DateTime lastLogin;

  Player({
    required this.id,
    required this.name,
    required this.xp,
    required this.level,
    required this.stashBalance,
    required this.unlockedLoot,
    required this.lastLogin,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'],
      name: map['name'],
      xp: map['xp'] ?? 0,
      level: map['level'] ?? 1,
      stashBalance: Decimal.parse(map['stashBalance']),
      unlockedLoot: List<String>.from(map['unlockedLoot'] ?? []),
      lastLogin: DateTime.parse(map['lastLogin']),
    );
  }
}
