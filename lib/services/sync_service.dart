import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/services/player_repository.dart';

class SyncService {
  final String _baseUrl = 'https://vault.cotillo.dev/api/v1/';
  final QuestRepository _questRepo;
  final PlayerRepository _playerRepo;

  SyncService(this._questRepo, this._playerRepo);

  Future<void> syncDown() async {
    // 1. Fetch from server
    // final response = await http.get(Uri.parse('${_baseUrl}sync'));
    // 2. Update local DB
  }

  Future<void> syncUp() async {
    // 1. Get local changes
    final player = await _playerRepo.getPlayer();
    if (player == null) return;

    // 2. Push to server
    try {
      // await http.post(
      //   Uri.parse('${_baseUrl}sync'),
      //   body: jsonEncode(player),
      // );
    } catch (_) {}
  }
}
