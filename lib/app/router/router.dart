import 'package:go_router/go_router.dart';
import 'package:soundfree/features/onboarding/screens/onboarding_screen.dart';
import 'package:soundfree/features/home/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnBoardingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
