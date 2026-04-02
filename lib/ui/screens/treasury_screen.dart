import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class TreasuryScreen extends StatelessWidget {
  const TreasuryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questRepo = RepositoryProvider.of<QuestRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('TREASURY', style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<PayCycle>>(
        future: questRepo.getCompletedPayCycles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyState(context);
          }

          final cycles = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: cycles.length,
            itemBuilder: (context, index) {
              final cycle = cycles[index];
              return _buildCycleCard(context, cycle);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.account_balance_wallet_outlined, size: 64, color: AppTheme.rusticParchment),
          const SizedBox(height: 16),
          Text(
            'THE TREASURY IS EMPTY',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.rusticParchment),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete your first pay cycle to harvest gold.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.rusticParchment.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildCycleCard(BuildContext context, PayCycle cycle) {
    final dateRange = '${DateFormat('MMM d').format(cycle.startDate)} - ${DateFormat('MMM d, y').format(cycle.endDate)}';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.midnightVoid.withOpacity(0.4),
        border: Border(
          bottom: BorderSide(color: AppTheme.gildedGold.withOpacity(0.1), width: 2),
        ),
        // borderRadius: BorderRadius.zero, // Default is zero
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HARVEST CYCLE',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.gildedGold),
              ),
              const SizedBox(height: 4),
              Text(
                dateRange,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.rusticParchment),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '+${cycle.totalHarvested} G',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.lifeEssence,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SECURED',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.lifeEssence.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
