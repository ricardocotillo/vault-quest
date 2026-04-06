import 'package:flutter/material.dart';
import 'package:envelope/core/theme/app_theme.dart';

class LootInventory extends StatelessWidget {
  final List<String> unlockedLoot;

  const LootInventory({super.key, required this.unlockedLoot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INVENTORY',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.gildedGold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        unlockedLoot.isEmpty ? _buildEmptyState(context) : _buildGrid(context),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.midnightVoid.withValues(alpha: 0.3),
        border: Border.all(
          color: AppTheme.rusticParchment.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Text(
          'NO LOOT RECOVERED YET',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.rusticParchment.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: unlockedLoot.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.midnightVoid.withValues(alpha: 0.5),
            border: Border.all(
              color: AppTheme.gildedGold.withValues(alpha: 0.3),
            ),
          ),
          child: const Icon(
            Icons.inventory_2,
            color: AppTheme.gildedGold,
            size: 24,
          ),
        );
      },
    );
  }
}
