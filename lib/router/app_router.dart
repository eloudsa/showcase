import 'package:go_router/go_router.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/form/presentation/form_page.dart';
import '../features/empty/presentation/empty_page.dart';
import '../features/home/presentation/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/home'),
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomePage()),
        GoRoute(path: '/form', builder: (context, state) => const FormPage()),
        GoRoute(path: '/empty', builder: (context, state) => const EmptyPage()),
      ],
    ),
  ],
);
