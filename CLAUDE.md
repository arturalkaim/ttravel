# CLAUDE.md - AI Assistant Guide for ttravel

This document provides comprehensive guidance for AI assistants working with the ttravel codebase.

## Project Overview

**ttravel** is a Flutter mobile application for travel functionality with integrated mapping capabilities. The app displays a user interface with a floating action button that opens a map view showing the user's location.

- **Version:** 1.0.0 (build 1)
- **Application ID:** com.example.ttravel
- **Platforms:** Android and iOS

## Technology Stack

| Technology | Version/Details |
|------------|-----------------|
| **Framework** | Flutter |
| **Language** | Dart |
| **Dart SDK** | >=2.0.0-dev.68.0 <3.0.0 |
| **Android SDK** | compileSdkVersion 27, minSdkVersion 16, targetSdkVersion 27 |
| **Gradle** | 4.10.2 |
| **iOS** | CocoaPods for dependency management |

### Dependencies

- `flutter` - Core Flutter framework
- `map_view: ^0.0.14` - Google Maps integration for displaying maps
- `cupertino_icons: ^0.1.2` - iOS-style icons

### Dev Dependencies

- `flutter_test` - Widget testing framework

## Project Structure

```
ttravel/
├── lib/                     # Dart source code
│   └── main.dart            # App entry point and main UI
├── test/                    # Test files
│   └── widget_test.dart     # Widget tests
├── android/                 # Android platform code
│   ├── app/
│   │   ├── build.gradle     # Android app configuration
│   │   └── src/main/        # Native Android code
│   ├── build.gradle         # Root Gradle config
│   └── settings.gradle      # Gradle module settings
├── ios/                     # iOS platform code
│   ├── Runner/              # iOS app project
│   ├── Podfile              # CocoaPods dependencies
│   └── Runner.xcworkspace/  # Xcode workspace (use this for iOS dev)
├── pubspec.yaml             # Dart/Flutter dependencies
├── pubspec.lock             # Locked dependency versions
└── .metadata                # Flutter framework metadata
```

## Key Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | Main application entry point containing all widgets and logic |
| `pubspec.yaml` | Package manifest defining dependencies and project config |
| `android/app/build.gradle` | Android build configuration |
| `ios/Podfile` | iOS CocoaPods dependency configuration |
| `test/widget_test.dart` | Widget tests for the app |

## Architecture

The app follows standard Flutter architecture patterns:

### Widget Structure

1. **MyApp** (`StatelessWidget`) - Root application widget
   - Configures MaterialApp with theme and home page

2. **MyHomePage** (`StatefulWidget`) - Main home page
   - Holds the page title configuration

3. **_MyHomePageState** (`State<MyHomePage>`) - Manages mutable state
   - `_counter` - Counter value (currently unused in UI interaction)
   - `_mapView` - MapView instance for displaying maps
   - Handles map location updates and toolbar actions

### Key Methods

- `initState()` - Initializes map view listeners
- `showMap()` - Opens the map view with configured options
- `_incrementCounter()` - Increments counter state (available but not connected to FAB)

## Development Workflow

### Common Commands

```bash
# Get dependencies
flutter pub get

# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device_id>

# Build for release
flutter build apk          # Android
flutter build ios          # iOS

# Run tests
flutter test

# Hot reload (while running)
# Press 'r' in terminal or save file in IDE

# Hot restart
# Press 'R' in terminal

# Analyze code
flutter analyze

# Format code
flutter format lib/
```

### Android Development

1. Ensure Android SDK is installed
2. Run `flutter pub get`
3. Run `flutter run` or open in Android Studio

### iOS Development

1. Ensure Xcode is installed
2. Run `flutter pub get`
3. Run `pod install` in the `ios/` directory
4. Open `ios/Runner.xcworkspace` in Xcode (not .xcodeproj)
5. Run `flutter run` or run from Xcode

### Map API Key

The map functionality requires a valid API key. Update the key in `lib/main.dart`:

```dart
MapView.setApiKey("YOUR_API_KEY_HERE");
```

## Code Conventions

### Dart/Flutter Conventions

1. **Widget naming**: PascalCase for widget classes
2. **Private members**: Prefix with underscore (`_counter`, `_mapView`)
3. **State classes**: Named as `_<WidgetName>State`
4. **File naming**: snake_case for file names
5. **Constructor parameters**: Use named parameters with `Key key`

### State Management

- Use `setState()` for updating state that affects UI
- Initialize listeners and async operations in `initState()`
- Clean up resources in `dispose()` when needed

### Widget Building

- Keep `build()` methods focused on UI
- Extract complex widgets into separate classes
- Use const constructors where possible

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Test Structure

Tests use the `flutter_test` package:

```dart
testWidgets('Description', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  // Assertions
});
```

## Important Notes for AI Assistants

### When Making Changes

1. **Read before editing**: Always read files before modifying them
2. **Preserve API key placeholder**: The map API key in `main.dart` uses `"---"` as a placeholder - do not commit real API keys
3. **Run tests**: After making changes, run `flutter test` to verify
4. **Check analysis**: Run `flutter analyze` to catch issues

### Code Style

1. Follow existing code patterns in the project
2. Use Material Design widgets (`Scaffold`, `AppBar`, etc.)
3. Keep inline comments for educational purposes (this is a demo project)
4. Use the `@override` annotation for overridden methods

### Dependencies

1. Check `pubspec.yaml` before adding new dependencies
2. Run `flutter pub get` after modifying dependencies
3. The `map_view` package requires platform-specific setup

### Platform-Specific Notes

**Android:**
- Minimum API level 16
- Build configuration in `android/app/build.gradle`
- MainActivity uses `FlutterActivity`

**iOS:**
- Uses CocoaPods for dependency management
- Open `.xcworkspace` (not `.xcodeproj`) for development
- BITCODE is disabled in Podfile

### Git Workflow

- Current branch pattern: `claude/<description>-<id>`
- Commit messages should be clear and descriptive
- Do not commit sensitive data (API keys, credentials)

## Potential Improvements

When working on this codebase, consider:

1. Separating widgets into multiple files under `lib/`
2. Adding proper error handling for map operations
3. Implementing state management solution (Provider, Riverpod, etc.)
4. Adding more comprehensive tests
5. Updating deprecated APIs (`display1` -> `displayLarge`)
6. Connecting the counter functionality or removing unused code

## Troubleshooting

### Common Issues

1. **Dependencies not found**: Run `flutter pub get`
2. **iOS build fails**: Run `pod install` in `ios/` directory
3. **Map not showing**: Verify API key is set correctly
4. **Hot reload not working**: Try hot restart with 'R'

### Getting Help

- Flutter documentation: https://flutter.dev/docs
- Dart documentation: https://dart.dev/guides
- map_view package: https://pub.dev/packages/map_view
