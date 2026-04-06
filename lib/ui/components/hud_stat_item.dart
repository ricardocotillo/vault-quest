import 'package:flutter/material.dart';
import 'package:envelope/ui/components/tokens.dart';

class HudStatItem extends StatelessWidget {
  const HudStatItem({super.key, required this.label, required this.value, required this.accentColor});

  final String label;
  final String value;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VQColors.surfaceContainerHigh,
        border: Border(left: BorderSide(color: accentColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: textTheme.labelSmall?.copyWith(color: accentColor)),
          const SizedBox(height: 8),
          Text(value, style: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
