import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class CurrencyMath {
  static final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: 'G', // "G" for Gold as per RPG theme
    decimalDigits: 2,
  );

  /// Converts a String (from DB) to Decimal
  static Decimal parse(String value) {
    try {
      return Decimal.parse(value);
    } catch (_) {
      return Decimal.zero;
    }
  }

  /// Converts Decimal to String (for DB)
  static String formatForDb(Decimal value) {
    return value.toString();
  }

  /// Formats Decimal for display with "G" symbol
  static String formatForDisplay(Decimal value) {
    return _currencyFormat.format(value.toDouble());
  }

  /// Adds two decimals safely
  static Decimal add(Decimal a, Decimal b) {
    return a + b;
  }

  /// Subtracts two decimals safely
  static Decimal subtract(Decimal a, Decimal b) {
    return a - b;
  }

  /// Calculates percentage (e.g. for progress bars)
  /// Returns a double between 0.0 and 1.0
  static double calculateProgress(Decimal current, Decimal target) {
    if (target <= Decimal.zero) return 0.0;
    if (current <= Decimal.zero) return 0.0;
    
    final ratio = (current / target).toDecimal(scaleOnInfinitePrecision: 4).toDouble();
    return ratio.clamp(0.0, 1.0);
  }
}
