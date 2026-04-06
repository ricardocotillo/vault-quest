import 'package:flutter/material.dart';
import 'package:envelope/ui/components/tokens.dart';

class ManaBar extends StatelessWidget {
  const ManaBar({super.key, required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final clamped = percentage.clamp(0.0, 1.0);
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: VQColors.surfaceLowest,
        border: Border.all(color: VQColors.surfaceContainerHighest, width: 2),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: clamped,
          child: Container(
            color: VQColors.secondary,
          ),
        ),
      ),
    );
  }
}
