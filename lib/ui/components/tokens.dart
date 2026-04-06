import 'package:flutter/material.dart';
import 'package:envelope/core/theme/app_theme.dart';

/// Visual palette aliases inspired by the VaultQuest specification.
class VQColors {
  static const Color primary = AppTheme.gildedGold;
  static const Color secondary = AppTheme.lifeEssence;
  static const Color tertiary = AppTheme.rusticParchment;

  static const Color surface = AppTheme.midnightVoid;
  static const Color surfaceLowest = Color(0xFF0D031D);
  static const Color surfaceContainerLow = Color(0xFF13052A);
  static const Color surfaceContainer = Color(0xFF1A063B);
  static const Color surfaceContainerHigh = Color(0xFF240A4D);
  static const Color surfaceContainerHighest = Color(0xFF2E0D61);

  static const Color surfaceBright = Color(0xFF6B3FA0);

  static const Color error = Colors.redAccent;
  static const Color onError = Colors.white;
}
