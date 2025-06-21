// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorialHash() => r'fa708cd30eef448ce0132b1534406383e0f82660';

/// See also [Tutorial].
@ProviderFor(Tutorial)
final tutorialProvider =
    AutoDisposeNotifierProvider<Tutorial, String?>.internal(
      Tutorial.new,
      name: r'tutorialProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tutorialHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Tutorial = AutoDisposeNotifier<String?>;
String _$tutorialRunningHash() => r'1ff368279cd053bf34948cb3f0514ec17d91ceb4';

/// See also [TutorialRunning].
@ProviderFor(TutorialRunning)
final tutorialRunningProvider =
    AutoDisposeNotifierProvider<TutorialRunning, bool>.internal(
      TutorialRunning.new,
      name: r'tutorialRunningProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tutorialRunningHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TutorialRunning = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
