import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/features/tutorial/application/tutorial_provider.dart';
import 'package:showcase/features/tutorial/presentation/widgets/skip_tutorial_button.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class FormPage extends ConsumerStatefulWidget {
  const FormPage({super.key});

  @override
  ConsumerState<FormPage> createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  // Keys are now stateful instance variables
  final GlobalKey _fieldKey = GlobalKey();
  final GlobalKey _okKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(tutorialProvider, (previous, next) {
      if (next == '/form') {
        _createFormTutorial(
          context,
          ref,
          _fieldKey,
          _okKey,
          _scrollController,
        ).show(context: context);
      }
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Form Showcase Page',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    key: _fieldKey,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        key: _okKey,
                        onPressed: () {},
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

TutorialCoachMark _createFormTutorial(
  BuildContext context,
  WidgetRef ref,
  GlobalKey fieldKey,
  GlobalKey okKey,
  ScrollController scrollController,
) {
  late TutorialCoachMark tutorial;

  final targets = [
    TargetFocus(
      identify: "field",
      keyTarget: fieldKey,
      shape: ShapeLightFocus.RRect,
      radius: 8,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: const Text(
            "This is a TextField.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    TargetFocus(
      identify: "ok-button",
      keyTarget: okKey,
      shape: ShapeLightFocus.RRect,
      radius: 8,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "Tap OK when done.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  ];

  tutorial = TutorialCoachMark(
    targets: targets,
    colorShadow: Colors.deepPurple,
    paddingFocus: 5,
    onFinish: () {
      ref.read(tutorialRunningProvider.notifier).stop();
      ref.read(tutorialProvider.notifier).clear();
    },
    onSkip: () {
      ref.read(tutorialRunningProvider.notifier).stop();
      ref.read(tutorialProvider.notifier).clear();
      return true;
    },
    skipWidget: buildSkipTutorialButton(onSkip: () => tutorial.skip()),
    onClickTargetWithTapPosition: (target, tapDetails) {
      if (target.identify == 'field') {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
      tutorial.next();
    },
  );
  return tutorial;
}
