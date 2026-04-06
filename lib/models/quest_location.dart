import 'package:decimal/decimal.dart';

enum LocationTheme {
  granary,
  tavern,
  armory,
  citadel,
  village,
  campsite;

  static LocationTheme fromString(String value) {
    return LocationTheme.values.firstWhere(
      (e) => e.name == value,
      orElse: () => LocationTheme.campsite,
    );
  }
}

class QuestLocation {
  final String id;
  final String name;
  final LocationTheme theme;
  final Decimal currentBalance;
  final Decimal allocatedBudget;
  final bool isUnderSiege;
  final double x;
  final double y;

  QuestLocation({
    required this.id,
    required this.name,
    required this.theme,
    required this.currentBalance,
    required this.allocatedBudget,
    required this.isUnderSiege,
    required this.x,
    required this.y,
  });

  factory QuestLocation.fromMap(Map<String, dynamic> map) {
    return QuestLocation(
      id: map['id'],
      name: map['name'],
      theme: LocationTheme.fromString(map['theme']),
      currentBalance: Decimal.parse(map['currentBalance']),
      allocatedBudget: Decimal.parse(map['allocatedBudget']),
      isUnderSiege: map['isUnderSiege'] ?? false,
      x: map['x'].toDouble(),
      y: map['y'].toDouble(),
    );
  }
}
