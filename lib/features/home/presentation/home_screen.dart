import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/core/tutorial_provider.dart';
import 'package:showcase/features/home/application/navigation_provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Keys are now stateful instance variables
  final GlobalKey _fabKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _formKey = GlobalKey();
  final GlobalKey _emptyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<String> routes = ['/home', '/form', '/empty'];
    final selectedIndex = ref.watch(navigationProvider);
    final isTutorialRunning = ref.watch(tutorialRunningProvider);

    // Tutorial listener
    ref.listen<String?>(tutorialProvider, (previous, next) {
      if (next == '/home') {
        ref.read(tutorialRunningProvider.notifier).start();
        _createHomeTutorial(
          context,
          ref,
          _fabKey,
          _homeKey,
          _formKey,
          _emptyKey,
        ).show(context: context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              final path = GoRouterState.of(context).uri.path;
              ref.read(tutorialProvider.notifier).showTutorialFor(path);
            },
            tooltip: 'Show Help',
          ),
        ],
      ),
      body: widget.child,
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              key: _fabKey,
              // heroTag is set to null to prevent the exception
              heroTag: null,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (isTutorialRunning) return;
          ref.read(navigationProvider.notifier).setIndex(index);
          context.go(routes[index]);
        },
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(key: _homeKey, child: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(key: _formKey, child: const Icon(Icons.input)),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(key: _emptyKey, child: const Icon(Icons.layers)),
            label: 'Empty',
          ),
        ],
      ),
    );
  }
}

TutorialCoachMark _createHomeTutorial(
  BuildContext context,
  WidgetRef ref,
  GlobalKey fabKey,
  GlobalKey homeKey,
  GlobalKey formKey,
  GlobalKey emptyKey,
) {
  late TutorialCoachMark tutorial;

  final targets = [
    TargetFocus(
      identify: "home-nav",
      keyTarget: homeKey,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "This is the Home page button.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    TargetFocus(
      identify: "form-nav",
      keyTarget: formKey,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "Navigate to the Form page.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    TargetFocus(
      identify: "empty-nav",
      keyTarget: emptyKey,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "Navigate to the Empty page.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    TargetFocus(
      identify: "fab",
      keyTarget: fabKey,
      shape: ShapeLightFocus.Circle,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: const Text(
            "This button is only visible on the Home page.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  ];

  tutorial = TutorialCoachMark(
    targets: targets,
    colorShadow: Colors.blueAccent,
    textSkip: "SKIP",
    paddingFocus: 5,
    opacityShadow: 0.8,
    onFinish: () {
      ref.read(tutorialRunningProvider.notifier).stop();
      ref.read(tutorialProvider.notifier).clear();
    },
    onSkip: () {
      ref.read(tutorialRunningProvider.notifier).stop();
      ref.read(tutorialProvider.notifier).clear();
      return true;
    },
    onClickTargetWithTapPosition: (target, tapDetails) {
      tutorial.next();
    },
  );
  return tutorial;
}
