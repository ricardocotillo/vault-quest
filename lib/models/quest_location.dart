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

  // New configuration fields
  final int? iconCodePoint;
  final int? colorValue;
  final String? fundingSource;
  final String? renewalFrequency;
  final String? rolloverRule;
  final String? overspendBehavior;
  final int? autoFillDay;
  final Decimal? lowBalanceAlert;
  final DateTime? targetDate;

  QuestLocation({
    required this.id,
    required this.name,
    required this.theme,
    required this.currentBalance,
    required this.allocatedBudget,
    required this.isUnderSiege,
    required this.x,
    required this.y,
    this.iconCodePoint,
    this.colorValue,
    this.fundingSource,
    this.renewalFrequency,
    this.rolloverRule,
    this.overspendBehavior,
    this.autoFillDay,
    this.lowBalanceAlert,
    this.targetDate,
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
      iconCodePoint: map['iconCodePoint'],
      colorValue: map['colorValue'],
      fundingSource: map['fundingSource'],
      renewalFrequency: map['renewalFrequency'],
      rolloverRule: map['rolloverRule'],
      overspendBehavior: map['overspendBehavior'],
      autoFillDay: map['autoFillDay'],
      lowBalanceAlert: map['lowBalanceAlert'] != null
          ? Decimal.parse(map['lowBalanceAlert'])
          : null,
      targetDate: map['targetDate'] != null
          ? DateTime.parse(map['targetDate'])
          : null,
    );
  }
}
