import 'package:decimal/decimal.dart';
import 'package:envelope/core/logic/currency_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyMath Tests', () {
    test('parse should convert string to Decimal', () {
      expect(CurrencyMath.parse('100.50'), Decimal.parse('100.50'));
      expect(CurrencyMath.parse('invalid'), Decimal.zero);
    });

    test('formatForDb should convert Decimal to string', () {
      expect(CurrencyMath.formatForDb(Decimal.parse('100.50')), '100.5');
    });

    test('add and subtract should work correctly', () {
      final a = Decimal.parse('100.50');
      final b = Decimal.parse('50.25');
      
      expect(CurrencyMath.add(a, b), Decimal.parse('150.75'));
      expect(CurrencyMath.subtract(a, b), Decimal.parse('50.25'));
    });

    test('calculateProgress should return correct ratio', () {
      final current = Decimal.parse('50.00');
      final target = Decimal.parse('100.00');
      
      expect(CurrencyMath.calculateProgress(current, target), 0.5);
      expect(CurrencyMath.calculateProgress(Decimal.parse('120.00'), target), 1.0);
      expect(CurrencyMath.calculateProgress(Decimal.parse('-10.00'), target), 0.0);
      expect(CurrencyMath.calculateProgress(current, Decimal.zero), 0.0);
    });
  });
}
