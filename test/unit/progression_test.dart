import 'package:flutter_test/flutter_test.dart';
import 'package:envelope/core/logic/evolution_logic.dart';
import 'package:envelope/models/quest_location.dart';

void main() {
  group('EvolutionLogic Tests', () {
    test('calculateLevel returns correct level based on XP', () {
      expect(EvolutionLogic.calculateLevel(0), 1);
      expect(EvolutionLogic.calculateLevel(500), 1);
      expect(EvolutionLogic.calculateLevel(1000), 2);
      expect(EvolutionLogic.calculateLevel(1500), 2);
      expect(EvolutionLogic.calculateLevel(10000), 11);
    });

    test('getEvolutionStage returns correct stage based on level', () {
      expect(EvolutionLogic.getEvolutionStage(1), LocationTheme.campsite);
      expect(EvolutionLogic.getEvolutionStage(4), LocationTheme.campsite);
      expect(EvolutionLogic.getEvolutionStage(5), LocationTheme.village);
      expect(EvolutionLogic.getEvolutionStage(9), LocationTheme.village);
      expect(EvolutionLogic.getEvolutionStage(10), LocationTheme.citadel);
      expect(EvolutionLogic.getEvolutionStage(100), LocationTheme.citadel);
    });

    test('xpForNextLevel returns correct XP required', () {
      expect(EvolutionLogic.xpForNextLevel(1), 1000);
      expect(EvolutionLogic.xpForNextLevel(2), 2000);
      expect(EvolutionLogic.xpForNextLevel(10), 10000);
    });
  });
}
