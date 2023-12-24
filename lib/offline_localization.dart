/// A simple Flutter package for convenient and offline localization using Excel files.
///
/// This package provides the `Loc` class, which allows you to manage translations
/// in your Flutter application using an Excel file stored locally.
library offline_localization;

import 'package:excel/excel.dart';
import 'dart:io';

/// A simple localization class that reads translations from an Excel file.
///
/// Usage:
/// ```dart
/// // Initialize Loc with the initial language
/// await Loc.initialize('assets/translations.xlsx', 'en');
///
/// // Get a translated value
/// String helloTranslation = Loc.get('hello_key');
/// ```
class Loc {
  // Private Variables
  static late Excel _excel;
  static late String _currentLanguage;
  static late Map<String, Map<String, String>> _translations;

  /// Initializes the Loc class with translations from the specified Excel file.
  ///
  /// This method loads translations from the Excel file located at [filePath]
  /// for the specified [currentLanguage]. It should be called before using
  /// the `get` method to retrieve translations.
  static Future<void> initialize(
      String filePath, String currentLanguage) async {
    _excel = Excel.decodeBytes(await File(filePath).readAsBytes());
    _currentLanguage = currentLanguage;
    _translations = await _loadTranslations();
  }

  /// Changes the current language and reloads translations from the Excel file.
  ///
  /// This method changes the current language to [newLanguage] and reloads
  /// translations from the Excel file located at [filePath]. It should be
  /// called when the user changes the language in the application.
  static Future<void> changeLocale(String filePath, String newLanguage) async {
    await initialize(filePath, newLanguage);
  }

  /// Retrieves the translated value for the specified key and current language.
  ///
  /// This method returns the translation for the given [key] in the current
  /// language. If the key is not found, it returns the key itself. Make sure
  /// to call `initialize` or `changeLocale` before using this method.
  static String get(String key) {
    if (_translations.containsKey(key)) {
      return _translations[key]![_currentLanguage] ?? key;
    }
    return key;
  }

  // Private Methods
  static Future<Map<String, Map<String, String>>> _loadTranslations() async {
    var translations = <String, Map<String, String>>{};

    var sheet = _excel.tables.keys.first;
    var keysRow = _excel.tables[sheet]!.rows.first;
    var languageIndex = keysRow
        .indexWhere((cell) => cell?.value.toString() == _currentLanguage);

    if (languageIndex != -1) {
      for (var row in _excel.tables[sheet]!.rows.skip(1)) {
        var key = row[0]?.value;
        var translation = row[languageIndex]?.value;

        if (key != null && translation != null) {
          translations[key.toString()] = {
            _currentLanguage: translation.toString()
          };
        }
      }
    }

    return translations;
  }
}
