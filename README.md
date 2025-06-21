# showcase

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

This project follows the principles of Clean Architecture, organizing code by feature. Each feature is located under the `lib/features` directory and is divided into layers:

- **/application**: Contains the business logic and state management (e.g., Riverpod providers).
- **/presentation**: Contains the UI widgets and screens.

This structure helps to keep the code organized, scalable, and easy to maintain.

## Code Generation

This project uses Riverpod for state management, which requires code generation for providers.

Before running the app, you need to generate the necessary files. You can do this in two ways:

### 1. Watch for changes

For development, it's recommended to run the watcher. It will automatically regenerate files whenever you save a change in a provider file.

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 2. Manual build

If you prefer to generate the code manually, run the following command:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
