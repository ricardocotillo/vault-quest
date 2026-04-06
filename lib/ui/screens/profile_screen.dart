import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:envelope/blocs/player_profile_bloc.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:envelope/core/logic/evolution_logic.dart';
import 'package:envelope/ui/widgets/loot_inventory.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PLAYER STATUS',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<PlayerProfileBloc, PlayerProfileState>(
        builder: (context, state) {
          if (state is PlayerProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlayerProfileLoaded) {
            final player = state.player;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, player),
                  const SizedBox(height: 48),
                  _buildManaBar(context, player),
                  const SizedBox(height: 48),
                  _buildStats(context, player),
                  const SizedBox(height: 48),
                  LootInventory(unlockedLoot: player.unlockedLoot),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          player.name.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: AppTheme.gildedGold,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'LEVEL ${player.level} ALCHEMIST',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.lifeEssence,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildManaBar(BuildContext context, player) {
    final xpInCurrentLevel = player.xp % 1000;
    final progress = xpInCurrentLevel / 1000;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('EXPERIENCE', style: Theme.of(context).textTheme.labelSmall),
            Text(
              '${player.xp} / ${EvolutionLogic.xpForNextLevel(player.level)} XP',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.midnightVoid.withValues(alpha: 0.3),
            border: Border.all(
              color: AppTheme.lifeEssence.withValues(alpha: 0.3),
            ),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.lifeEssence, Color(0xFF00FF88)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context, player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatRow(context, 'THE STASH', '${player.stashBalance} G'),
        const SizedBox(height: 16),
        _buildStatRow(
          context,
          'LOOT UNLOCKED',
          '${player.unlockedLoot.length} ITEMS',
        ),
        const SizedBox(height: 16),
        _buildStatRow(
          context,
          'LAST MEDITATION',
          player.lastLogin.toString().split('.')[0],
        ),
      ],
    );
  }

  Widget _buildStatRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.rusticParchment,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
