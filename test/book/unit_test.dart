import 'package:e_books/commons/extentions/string_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('countSimplify()', () {
    test('returns full number for numbers below 1000', () {
      expect(123.countSimplify(), '123');
      expect(999.countSimplify(), '999');
    });

    test('simplifies thousands correctly', () {
      expect(1000.countSimplify(), '1k');
      expect(1500.countSimplify(), '1.5k');
      expect(20000.countSimplify(), '20k');
      expect(22500.countSimplify(), '22.5k');
      expect(100000.countSimplify(), '100k');
    });

    test('simplifies millions correctly', () {
      expect(1000000.countSimplify(), '1M');
      expect(1500000.countSimplify(), '1.5M');
      expect(12000000.countSimplify(), '12M');
    });

    test('simplifies billions correctly', () {
      expect(1000000000.countSimplify(), '1B');
      expect(1500000000.countSimplify(), '1.5B');
      expect(32000000000.countSimplify(), '32B');
    });
  });
}
