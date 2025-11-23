import 'package:flutter/material.dart';
import 'package:soundfree/app/theme/colors.dart';

class SoundFreeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;

  const SoundFreeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: SoundFreeColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: SoundFreeColors.text, size: 24),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: SoundFreeColors.text)),
        ],
      ),
    );
  }
}
