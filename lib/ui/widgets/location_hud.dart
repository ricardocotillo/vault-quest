import 'package:flutter/material.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:envelope/core/logic/currency_math.dart';
import 'package:envelope/ui/animations/seal_animation.dart';

class LocationHUD extends StatelessWidget {
  final QuestLocation location;
  final VoidCallback onSpendRequested;

  const LocationHUD({
    super.key,
    required this.location,
    required this.onSpendRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppTheme.rusticParchment,
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildBalance(context),
          const SizedBox(height: 32),
          _buildProgressBar(context),
          const SizedBox(height: 40),
          _buildActionSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          location.name.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppTheme.midnightVoid,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: AppTheme.midnightVoid),
        ),
      ],
    );
  }

  Widget _buildBalance(BuildContext context) {
    return Column(
      children: [
        Text(
          'REMAINING GOLD',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.midnightVoid.withValues(alpha: 0.6),
          ),
        ),
        Text(
          CurrencyMath.formatForDisplay(location.currentBalance),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppTheme.midnightVoid,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    final progress = CurrencyMath.calculateProgress(
      location.currentBalance,
      location.allocatedBudget,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ALLOCATED: ${CurrencyMath.formatForDisplay(location.allocatedBudget)}',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: AppTheme.midnightVoid),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.midnightVoid,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.midnightVoid.withValues(alpha: 0.1),
            borderRadius: BorderRadius.zero,
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(color: AppTheme.lifeEssence),
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'BREAK THE SEAL TO SPEND',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.midnightVoid.withValues(alpha: 0.6),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        SealAnimation(
          onComplete: () {
            Navigator.pop(context);
            onSpendRequested();
          },
        ),
      ],
    );
  }
}
