import 'package:envelope/models/quest_location.dart';

class EvolutionLogic {
  /// Simple XP to Level calculation: Level = (XP / 1000) + 1
  static int calculateLevel(int xp) {
    return (xp / 1000).floor() + 1;
  }

  /// Maps level to a specific evolution stage
  static LocationTheme getEvolutionStage(int level) {
    if (level >= 10) return LocationTheme.citadel;
    if (level >= 5) return LocationTheme.village;
    return LocationTheme.campsite;
  }

  /// XP needed for next level
  static int xpForNextLevel(int level) {
    return level * 1000;
  }
}
