import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:envelope/models/vault_presets.dart';
import 'package:envelope/blocs/add_vault_bloc.dart';
import 'package:envelope/ui/components/tokens.dart';
import 'package:envelope/services/haptics_service.dart';

class VaultPresetPicker extends StatelessWidget {
  const VaultPresetPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: VQColors.surface,
        border: Border(top: BorderSide(color: VQColors.primary, width: 4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SELECT STRUCTURE TYPE',
            style: textTheme.headlineSmall?.copyWith(color: VQColors.primary),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a blueprint for your new vault.',
            style: textTheme.bodySmall?.copyWith(color: VQColors.tertiary),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: VaultPreset.presets.length,
            itemBuilder: (context, index) {
              final preset = VaultPreset.presets[index];
              return _PresetCard(preset: preset);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _PresetCard extends StatelessWidget {
  final VaultPreset preset;

  const _PresetCard({required this.preset});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        HapticsService.tap();
        context.read<AddVaultBloc>().add(SelectPreset(preset));
        context.pop(); // Close bottom sheet
        context.push('/add-vault'); // Navigate to config screen
      },
      child: Container(
        decoration: BoxDecoration(
          color: VQColors.surfaceContainerLow,
          border: Border.all(color: preset.color.withValues(alpha: 0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(preset.icon, color: preset.color, size: 32),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                preset.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: textTheme.labelSmall?.copyWith(
                  color: preset.color,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
