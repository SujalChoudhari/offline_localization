# Offline Localization
An Offline tool for Localizations using Excel files.

## Overview

`offline_localization` is a simple localization package for Flutter applications that allows you to
manage translations offline using Excel files. It provides an easy-to-use interface for
initializing, changing, and retrieving translations in multiple languages.

## Features

- **Offline Localization:** Read and manage translations directly from Excel files stored locally in
  the assets folder.
- **Simple Integration:** Initialize the localization with a single line of code and change the
  locale effortlessly.
- **Efficient Retrieval:** Retrieve translations using a key and the current language, handling
  fallbacks gracefully.

## Installation

To use this package, add `offline_localization` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  offline_localization: ^1.0.2
```

## Getting Started

### Initialize Localization

```dart
import 'package:offline_localization/offline_localization.dart';

void main() async {
  // Replace 'assets/translations.xlsx' with the path to your Excel file
  final excelFilePath = 'assets/translations.xlsx';
  // Replace 'en' with the default language in your Excel file
  final defaultLanguage = 'en';

  await Loc.initialize(excelFilePath, defaultLanguage);

  // Your app code...
}
```

### Change Locale

```dart
// Change the current language to 'fr'
await Loc.changeLocale("assets/translations.xlsx",'fr');
```

### Retrieve Translations

```dart
// Get the translation for the key 'hello_key'
String translation = Loc.get('hello_key');
```

## Example

See the example directory for a sample Flutter application using `offline_localization`.

## Note

This package assumes that the Excel file follows a specific format, with keys in the first column
and languages in subsequent columns. Make sure your Excel file is structured accordingly.
| keys | lang1 | lang2 | lang3 | 
|------|-------|-------|-------|
| hello_key | Hello in Lang 1 | Hello in Lang2 | Hello in Lang 3 |
| other_key | Other in Lang 1 | Other in Lang2 | Other in Lang 3 |

## Issues and Feedback

Please file [issues](https://github.com/SujalChoudhari/offline_localization/issues) to send feedback
or report a bug. Thank you!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
