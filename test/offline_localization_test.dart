import 'package:flutter_test/flutter_test.dart';
import 'package:offline_localization/offline_localization.dart';

void main() {
  group('Loc Tests', () {
    setUp(() async {
      final excelFilePath = 'assets/test.xlsx';
      final initialLanguage = 'lang1';
      await Loc.initialize(excelFilePath, initialLanguage);
    });

    test('Initial Language Translation', () {
      expect(Loc.get('hello_key'), equals('Initial Hello'));
    });

    test('Change Locale and Verify Translation', () async {
      await Loc.changeLocale('assets/test.xlsx', 'lang2');
      expect(Loc.get('hello_key'), equals('Hello in Lang2'));
    });

    test('Translation for Nonexistent Key', () {
      expect(Loc.get('nonexistent_key'), equals('nonexistent_key'));
    });

    tearDown(() {
      // Clean up or additional actions after each test if needed
    });
  });
}
