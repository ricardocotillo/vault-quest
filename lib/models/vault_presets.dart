import 'package:flutter/material.dart';
import 'package:envelope/models/quest_location.dart';

enum RenewalFrequency {
  monthly,
  biweekly,
  oneTime;

  String get label {
    switch (this) {
      case RenewalFrequency.monthly:
        return 'Monthly';
      case RenewalFrequency.biweekly:
        return 'Bi-Weekly';
      case RenewalFrequency.oneTime:
        return 'One-Time';
    }
  }
}

enum RolloverRule {
  rollover,
  reset;

  String get label {
    switch (this) {
      case RolloverRule.rollover:
        return 'Rollover';
      case RolloverRule.reset:
        return 'Reset';
    }
  }
}

enum OverspendBehavior {
  hardStop,
  buffer;

  String get label {
    switch (this) {
      case OverspendBehavior.hardStop:
        return 'Hard Stop';
      case OverspendBehavior.buffer:
        return 'Buffer';
    }
  }
}

class VaultPreset {
  final String name;
  final String category;
  final LocationTheme theme;
  final IconData icon;
  final Color color;

  const VaultPreset({
    required this.name,
    required this.category,
    required this.theme,
    required this.icon,
    required this.color,
  });

  static const List<VaultPreset> presets = [
    VaultPreset(
      name: 'Grocery Granary',
      category: 'Groceries',
      theme: LocationTheme.granary,
      icon: Icons.shopping_cart,
      color: Colors.green,
    ),
    VaultPreset(
      name: 'Dining Tavern',
      category: 'Dining',
      theme: LocationTheme.tavern,
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    VaultPreset(
      name: 'Gas Station Outpost',
      category: 'Gas',
      theme: LocationTheme.campsite,
      icon: Icons.local_gas_station,
      color: Colors.orange,
    ),
    VaultPreset(
      name: 'Entertainment Keep',
      category: 'Entertainment',
      theme: LocationTheme.citadel,
      icon: Icons.sports_esports,
      color: Colors.purple,
    ),
    VaultPreset(
      name: 'Hearth Hall',
      category: 'House Bills',
      theme: LocationTheme.village,
      icon: Icons.home,
      color: Colors.blue,
    ),
    VaultPreset(
      name: 'Dragon\'s Hoard',
      category: 'Savings',
      theme: LocationTheme.armory,
      icon: Icons.savings,
      color: Color(0xFFFFD700), // Gold
    ),
    VaultPreset(
      name: 'Debt Dungeon',
      category: 'Debt',
      theme: LocationTheme.campsite,
      icon: Icons.gavel,
      color: Colors.red,
    ),
    VaultPreset(
      name: 'Rent Rampart',
      category: 'Rent',
      theme: LocationTheme.citadel,
      icon: Icons.apartment,
      color: Colors.teal,
    ),
    VaultPreset(
      name: 'Custom Outpost',
      category: 'Custom',
      theme: LocationTheme.village,
      icon: Icons.edit,
      color: Color(0xFFDAC49B), // Parchment
    ),
  ];
}
