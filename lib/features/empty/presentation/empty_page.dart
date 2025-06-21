import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/features/tutorial/application/tutorial_provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class EmptyPage extends ConsumerStatefulWidget {
  const EmptyPage({super.key});

  @override
  ConsumerState<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends ConsumerState<EmptyPage> {
  final GlobalKey _pressKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(tutorialProvider, (previous, next) {
      if (next == '/empty') {
        _createEmptyPageTutorial(
          context,
          ref,
          _pressKey,
        ).show(context: context);
      }
    });

    return Center(
      child: ElevatedButton(
        key: _pressKey,
        onPressed: () {},
        child: const Text('Press'),
      ),
    );
  }
}

TutorialCoachMark _createEmptyPageTutorial(
  BuildContext context,
  WidgetRef ref,
  GlobalKey key,
) {
  final targets = [
    TargetFocus(
      identify: "press-button",
      keyTarget: key,
      shape: ShapeLightFocus.RRect,
      radius: 8,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "This is a button.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  ];

  return TutorialCoachMark(
    targets: targets,
    colorShadow: Colors.deepPurple,
    textSkip: "SKIP",
    paddingFocus: 5,
    onFinish: () => ref.read(tutorialProvider.notifier).clear(),
    onSkip: () {
      ref.read(tutorialProvider.notifier).clear();
      return true;
    },
  );
}
