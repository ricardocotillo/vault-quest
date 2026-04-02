import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color midnightVoid = Color(0xFF1A063B);
  static const Color gildedGold = Color(0xFFE9C400);
  static const Color lifeEssence = Color(0xFF66DD8B);
  static const Color rusticParchment = Color(0xFFDAC49B);

  static ThemeData get theme {
    final textTheme = _textTheme;
    
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: midnightVoid,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: gildedGold,
        onPrimary: midnightVoid,
        secondary: lifeEssence,
        onSecondary: midnightVoid,
        tertiary: rusticParchment,
        onTertiary: midnightVoid,
        surface: midnightVoid,
        onSurface: Colors.white,
        surfaceContainerLowest: Color(0xFF0D031D),
        surfaceContainerLow: Color(0xFF13052A),
        surfaceContainer: Color(0xFF1A063B),
        surfaceContainerHigh: Color(0xFF240A4D),
        surfaceContainerHighest: Color(0xFF2E0D61),
        error: Colors.redAccent,
        onError: Colors.white,
        outlineVariant: Color(0x26FFFFFF), // 15% opacity white
      ),
      textTheme: textTheme,
      cardTheme: const CardThemeData(
        color: rusticParchment,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gildedGold,
          foregroundColor: midnightVoid,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          textStyle: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF0D031D), // surfaceContainerLowest
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: gildedGold, width: 2),
        ),
        labelStyle: GoogleFonts.spaceGrotesk(color: rusticParchment),
        hintStyle: GoogleFonts.manrope(color: Colors.white38),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: gildedGold,
      ),
      displayMedium: GoogleFonts.spaceGrotesk(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: gildedGold,
      ),
      displaySmall: GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: gildedGold,
      ),
      headlineLarge: GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: gildedGold,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: gildedGold,
      ),
      headlineSmall: GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: gildedGold,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelLarge: GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.1,
        color: rusticParchment,
      ),
      labelMedium: GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.1,
        color: rusticParchment,
      ),
      labelSmall: GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.1,
        color: rusticParchment,
      ),
    );
  }
}
