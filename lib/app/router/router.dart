import 'package:go_router/go_router.dart';
import 'package:soundfree/features/onboarding/screens/onboarding_screen.dart';
import 'package:soundfree/features/home/screens/home_screen.dart';
import 'package:soundfree/features/tabs/songs/screens/songs_screen.dart';
import 'package:soundfree/features/tabs/playlists/screens/playlists_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnBoardingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/songs', builder: (context, state) => const SongsScreen()),
    GoRoute(
      path: '/playlists',
      builder: (context, state) => const PlaylistsScreen(),
    ),
  ],
);
