import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:soundfree/features/tabs/songs/screens/songs_screen.dart';
import 'package:soundfree/features/tabs/playlists/screens/playlists_screen.dart';
import 'package:soundfree/app/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [SongsScreen(), PlaylistsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: SoundFreeColors.primary,
        selectedItemColor: SoundFreeColors.primaryLight,
        unselectedItemColor: SoundFreeColors.text,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.musicNote),
            label: 'Canciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.playlistPlay),
            label: 'Playlists',
          ),
        ],
      ),
    );
  }
}
