import 'package:envelope/models/player.dart';
import 'package:envelope/services/database.dart' hide Player;
import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'dart:convert';

class PlayerRepository {
  final AppDatabase _db;

  PlayerRepository(this._db);

  Future<Player?> getPlayer() async {
    final results = await _db.select(_db.players).get();
    if (results.isEmpty) return null;
    
    final row = results.first;
    return Player(
      id: row.id,
      name: row.name,
      xp: row.xp,
      level: row.level,
      stashBalance: Decimal.parse(row.stashBalance),
      unlockedLoot: List<String>.from(jsonDecode(row.unlockedLoot ?? '[]')),
      lastLogin: row.lastLogin,
    );
  }

  Future<void> updateXpAndLevel(int xp, int level) async {
    await (_db.update(_db.players)..where((t) => t.id.isNotNull())).write(
      PlayersCompanion(
        xp: Value(xp),
        level: Value(level),
      ),
    );
  }

  Future<void> updateStashBalance(Decimal newBalance) async {
    await (_db.update(_db.players)..where((t) => t.id.isNotNull())).write(
      PlayersCompanion(
        stashBalance: Value(newBalance.toString()),
      ),
    );
  }

  Future<void> createPlayer(Player player) async {
    await _db.into(_db.players).insert(
      PlayersCompanion.insert(
        id: player.id,
        name: player.name,
        xp: Value(player.xp),
        level: Value(player.level),
        stashBalance: player.stashBalance.toString(),
        unlockedLoot: Value(jsonEncode(player.unlockedLoot)),
        lastLogin: player.lastLogin,
      ),
    );
  }
}
