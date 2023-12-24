// example/main.dart

import 'package:offline_localization/offline_localization.dart';

void main() async {
  // Use Case 1: Initialize with Default Language
  await Loc.initialize('assets/translations.xlsx', 'en');

  // Get translations
  print('Use Case 1: ${Loc.get('hello_key')}');

  // Use Case 2: Change Locale and Retrieve Translations
  await Loc.changeLocale('assets/translations.xlsx', 'fr');

  // Get translations after changing locale
  print('Use Case 2: ${Loc.get('hello_key')}');

  // Use Case 3: Get Translation for Nonexistent Key
  print('Use Case 3: ${Loc.get('nonexistent_key')}');
}
