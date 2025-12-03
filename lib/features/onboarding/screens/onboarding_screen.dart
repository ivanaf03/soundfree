import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:soundfree/app/theme/colors.dart';
import 'package:soundfree/core/components/soundfree_button.dart';
import 'package:soundfree/features/onboarding/controllers/start_app_button_controller.dart';
import 'package:soundfree/features/onboarding/controllers/github_button_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SoundFreeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        SoundFreeColors.primary,
                        SoundFreeColors.secondary,
                      ],
                    ).createShader(bounds),
                    child: const Text(
                      'SoundFree',
                      style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset('assets/logo.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: SoundFreeButton(
                            text: 'Empezar a escuchar',
                            iconData: MdiIcons.music,
                            onPressed: () =>
                                StartAppButtonController().startApp(context),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SoundFreeButton(
                            text: 'Apoyar al creador',
                            onPressed: () =>
                                GitHubButtonController().openGithubRepo(),
                            iconData: MdiIcons.github,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
