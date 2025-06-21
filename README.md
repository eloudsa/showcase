# Flutter Showcase: Modern App Architecture

This project is a showcase of modern Flutter application architecture, demonstrating best practices for building scalable, maintainable, and user-friendly apps. It serves as a practical reference for implementing Clean Architecture, advanced state management with Riverpod, and interactive user onboarding.

## Key Features & Concepts

- **Clean Architecture**: The codebase is organized by feature modules (`/lib/features`), separating concerns into distinct layers:
  - **/application**: Business logic and state management (Riverpod providers).
  - **/presentation**: UI components (Widgets and Screens).
- **State Management with Riverpod**: Leverages `flutter_riverpod` (v2) with `riverpod_generator` for a type-safe, compile-time checked, and scalable state management solution.
- **Interactive User Tutorial**: Implements a multi-step, interactive tutorial using the `tutorial_coach_mark` package to guide users through the app's features upon first launch.
- **Declarative Routing**: Uses `go_router` for a robust, URL-based navigation system that includes a `ShellRoute` to persist UI elements like the bottom navigation bar.

## Getting Started

To get this project up and running, follow these steps.

### 1. Install Dependencies

```sh
flutter pub get
```

### 2. Run Code Generation

This project uses `build_runner` to generate code for Riverpod providers. For development, it's highly recommended to run the watcher, which automatically regenerates files on save.

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

Alternatively, you can run a one-time build:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App

```sh
flutter run
```
