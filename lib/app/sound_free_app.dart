import 'package:flutter/material.dart';
import 'package:soundfree/app/router/router.dart';

class SoundFreeApp extends StatelessWidget {
  const SoundFreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SoundFree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
