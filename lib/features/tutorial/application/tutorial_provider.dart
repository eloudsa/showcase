import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial_provider.g.dart';

@riverpod
class Tutorial extends _$Tutorial {
  @override
  String? build() => null;

  void showTutorialFor(String path) {
    state = path;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class TutorialRunning extends _$TutorialRunning {
  @override
  bool build() => false;

  void start() => state = true;
  void stop() => state = false;
}
