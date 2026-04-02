# Quickstart: VaultQuest Development

## Prerequisites
- **Flutter SDK**: 3.x+
- **Dart SDK**: 3.x+
- **`decimal` package**: For currency precision.
- **`flutter_riverpod`**: For state management.
- **`drift`**: For local storage.

## Initial Setup
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. If using `drift`, run `flutter pub run build_runner build --delete-conflicting-outputs` to generate the database code.

## Core Interactions (Local Tests)
Run unit tests for currency logic:
```bash
flutter test test/unit/logic_test.dart
```

Run widget tests for the Kingdom Map:
```bash
flutter test test/widget/map_test.dart
```

## Running the App
```bash
flutter run
```

## Key Development Markers
- **Precision (decimal)**: Never use `double` for money. Use `Decimal.parse(string)` or `Decimal.fromInt(cents)`.
- **Performance (60fps)**: Monitor frames using the Flutter DevTools Performance overlay.
- **Local-First**: Test features in airplane mode to ensure they work offline before any sync features are added.
