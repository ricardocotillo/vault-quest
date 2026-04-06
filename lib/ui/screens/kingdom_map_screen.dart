import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/ui/animations/map_painter.dart';
import 'package:envelope/ui/components/effects.dart';
import 'package:envelope/ui/components/hud_stat_item.dart';
import 'package:envelope/ui/components/mana_bar.dart';
import 'package:envelope/ui/components/structure_card.dart';
import 'package:envelope/ui/components/tokens.dart';
import 'package:envelope/ui/widgets/quest_location_node.dart';
import 'package:envelope/ui/screens/vault_preset_picker.dart';

class KingdomMapScreen extends StatefulWidget {
  const KingdomMapScreen({super.key});

  @override
  State<KingdomMapScreen> createState() => _KingdomMapScreenState();
}

class _KingdomMapScreenState extends State<KingdomMapScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fireController;
  final NumberFormat _gpFormat = NumberFormat('#,##0');

  @override
  void initState() {
    super.initState();
    context.read<KingdomMapBloc>().add(LoadKingdomMap());
    _fireController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _fireController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.midnightVoid,
      appBar: _buildStatusAppBar(),
      bottomNavigationBar: _buildBottomNav(context),
      body: BlocBuilder<KingdomMapBloc, KingdomMapState>(
        builder: (context, state) {
          if (state is KingdomMapLoading || state is KingdomMapInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is KingdomMapError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is KingdomMapLoaded) {
            return _buildMapContent(context, state.locations);
          }
          return const SizedBox();
        },
      ),
    );
  }

  PreferredSizeWidget _buildStatusAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: BlocBuilder<KingdomMapBloc, KingdomMapState>(
        builder: (context, state) {
          final textTheme = Theme.of(context).textTheme;
          final totalBalance = state is KingdomMapLoaded
              ? _sumCurrent(state.locations)
              : Decimal.zero;
          final manaRatio = state is KingdomMapLoaded
              ? _averageFill(state.locations)
              : 0.75;

          return AppBar(
            backgroundColor: VQColors.surface.withValues(alpha: 0.9),
            elevation: 0,
            titleSpacing: 24,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/profile'),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: VQColors.surfaceContainerHighest,
                          border: Border.all(color: VQColors.primary, width: 2),
                        ),
                        child: const FlutterLogo(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LEVEL 42 PALADIN',
                          style: textTheme.labelSmall?.copyWith(
                            color: VQColors.tertiary,
                          ),
                        ),
                        Text(
                          'THE STASH',
                          style: textTheme.headlineMedium?.copyWith(
                            color: VQColors.primary,
                            letterSpacing: -1,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: VQColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatGpDecimal(totalBalance),
                          style: textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 128,
                      height: 6,
                      color: VQColors.surfaceLowest,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 128 * manaRatio,
                          color: VQColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMapContent(BuildContext context, List<QuestLocation> locations) {
    final textTheme = Theme.of(context).textTheme;
    final totalTreasury = _sumCurrent(locations);
    final defenseBonus =
        '+${(locations.where((loc) => !loc.isUnderSiege).length * 4).toString()}% AR';
    final upkeep = '-${(locations.length * 45).toString()} GP/day';
    final merchantRank = locations.any((loc) => _balanceRatio(loc) > 1)
        ? 'S-CLASS'
        : 'A-CLASS';

    return Stack(
      children: [
        Positioned.fill(
          child: RepaintBoundary(
            child: CustomPaint(painter: MapPainter(locations)),
          ),
        ),
        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 120,
              bottom: 80,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'KINGDOM OF AETHELGARD',
                      textAlign: TextAlign.center,
                      style: textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeaderBadge(
                          context,
                          'Territory: Fortified',
                          VQColors.secondary,
                        ),
                        const SizedBox(width: 16),
                        _buildHeaderBadge(
                          context,
                          'Cycle: Day 14',
                          VQColors.tertiary,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                ...locations.map(
                  (loc) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: _buildStructureCard(context, loc),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _buildAddStructureCard(context),
                ),
                const SizedBox(height: 48),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2,
                  children: [
                    HudStatItem(
                      label: 'Total Treasury',
                      value: _formatGpDecimal(totalTreasury),
                      accentColor: VQColors.primary,
                    ),
                    HudStatItem(
                      label: 'Defense Bonus',
                      value: defenseBonus,
                      accentColor: VQColors.secondary,
                    ),
                    HudStatItem(
                      label: 'Upkeep Cost',
                      value: upkeep,
                      accentColor: VQColors.error,
                    ),
                    HudStatItem(
                      label: 'Merchant Rank',
                      value: merchantRank,
                      accentColor: VQColors.surfaceBright,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStructureCard(BuildContext context, QuestLocation location) {
    if (location.isUnderSiege) {
      return _buildSiegeCard(context, location);
    }

    final textTheme = Theme.of(context).textTheme;
    final ratio = _balanceRatio(location);
    final status = _statusForRatio(ratio);
    final background = _backgroundForTheme(location.theme);
    final description = _descriptionForTheme(location.theme);

    return StructureCard(
      backgroundColor: background,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level ${_levelForTheme(location.theme)} Structure'
                        .toUpperCase(),
                    style: textTheme.labelSmall?.copyWith(
                      color: VQColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location.name.toUpperCase(),
                    style: textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: VQColors.secondary),
              ),
              child: Text(
                status.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(
                  color: VQColors.secondary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(width: 100, child: QuestLocationNode(location: location)),
          ],
        ),
        const SizedBox(height: 16),
        Text(description, style: textTheme.bodySmall),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Inventory Health'.toUpperCase(), style: textTheme.labelSmall),
            Text(
              '${_formatGpDecimal(location.currentBalance)} / ${_formatGpDecimal(location.allocatedBudget)}',
              style: textTheme.headlineSmall?.copyWith(
                color: VQColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ManaBar(percentage: ratio),
      ],
    );
  }

  Widget _buildSiegeCard(BuildContext context, QuestLocation location) {
    final textTheme = Theme.of(context).textTheme;
    final ratio = _balanceRatio(location);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: VQColors.surfaceLowest,
        border: Border.all(color: VQColors.error, width: 4),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 128,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x33FFB4AB), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: VQColors.error,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        location.name.toUpperCase(),
                        style: textTheme.headlineMedium?.copyWith(
                          color: VQColors.error,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  FadeTransition(
                    opacity: _fireController,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      color: VQColors.error,
                      child: Text(
                        'SIEGE IMMINENT',
                        style: textTheme.labelSmall?.copyWith(
                          color: VQColors.onError,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Critical Alert: ${location.name} coffers are dry. Immediate gold injection required!',
                style: textTheme.bodySmall?.copyWith(
                  color: VQColors.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Structural Integrity'.toUpperCase(),
                    style: textTheme.labelSmall?.copyWith(
                      color: VQColors.error,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    '${_formatGpDecimal(location.currentBalance)} / ${_formatGpDecimal(location.allocatedBudget)}',
                    style: textTheme.displaySmall?.copyWith(
                      color: VQColors.error,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 32,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: VQColors.surface,
                  border: Border.all(color: VQColors.error, width: 2),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: ratio.clamp(0.0, 1.0),
                    child: Container(color: VQColors.error),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: QuestLocationNode(location: location),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddStructureCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => const VaultPresetPicker(),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: VQColors.surfaceContainerLow.withValues(alpha: 0.5),
          border: Border.all(
            color: VQColors.primary.withValues(alpha: 0.3),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.add_home_work_outlined,
              color: VQColors.primary,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'ERECT NEW STRUCTURE',
              style: textTheme.titleMedium?.copyWith(
                color: VQColors.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Expand your kingdom\'s influence',
              style: textTheme.bodySmall?.copyWith(
                color: VQColors.tertiary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBadge(
    BuildContext context,
    String text,
    Color accentColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: VQColors.surfaceContainerHigh,
        border: Border(left: BorderSide(color: accentColor, width: 4)),
      ),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: accentColor),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 64,
      color: VQColors.surfaceLowest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.map, 'Kingdom', isActive: true),
          _buildNavItem(context, Icons.mail, 'Quests'),
          _buildNavItem(context, Icons.inventory_2, 'Armory'),
          _buildNavItem(context, Icons.history, 'Archive'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label, {
    bool isActive = false,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final color = isActive ? VQColors.surface : VQColors.tertiary;
    final bgColor = isActive ? VQColors.primary : Colors.transparent;

    return Container(
      width: 80,
      color: bgColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(boxShadow: goldBevelShadow),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                label.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Decimal _sumCurrent(List<QuestLocation> locations) {
    return locations.fold<Decimal>(
      Decimal.zero,
      (sum, loc) => sum + loc.currentBalance,
    );
  }

  double _averageFill(List<QuestLocation> locations) {
    if (locations.isEmpty) return 0.0;
    final ratios = locations.map(_balanceRatio).toList();
    return ratios.reduce((a, b) => a + b) / ratios.length;
  }

  double _balanceRatio(QuestLocation location) {
    if (location.allocatedBudget == Decimal.zero) {
      return 0;
    }
    final ratioDecimal = location.currentBalance / location.allocatedBudget;
    return double.tryParse(ratioDecimal.toString())?.clamp(0.0, 1.0) ?? 0.0;
  }

  String _formatGpDecimal(Decimal value) {
    final doubleValue = double.tryParse(value.toString()) ?? 0;
    return '${_gpFormat.format(doubleValue)} GP';
  }

  Color _backgroundForTheme(LocationTheme theme) {
    switch (theme) {
      case LocationTheme.granary:
        return VQColors.surfaceContainerLow;
      case LocationTheme.tavern:
        return VQColors.surfaceContainerHigh;
      case LocationTheme.armory:
        return VQColors.surfaceContainerHighest;
      case LocationTheme.citadel:
        return VQColors.surface;
      case LocationTheme.village:
        return VQColors.surfaceContainer;
      case LocationTheme.campsite:
        return VQColors.surfaceLowest;
    }
  }

  String _descriptionForTheme(LocationTheme theme) {
    switch (theme) {
      case LocationTheme.granary:
        return 'Stockpiles are overflowing. Your citizens are well-fed and the supply lines remain secure.';
      case LocationTheme.tavern:
        return 'The masonry is showing signs of neglect. Patrons whisper about the dwindling reserves.';
      case LocationTheme.armory:
        return 'Smiths are reforging legendary arms. Shield walls await your next command.';
      case LocationTheme.citadel:
        return 'The citadel spires glimmer, broadcasting prosperity across the realm.';
      case LocationTheme.village:
        return 'Villagers trade spices and stories under lantern light, awaiting new quests.';
      case LocationTheme.campsite:
        return 'Nomad caravans pitch vibrant tents while scouts watch the horizon.';
    }
  }

  int _levelForTheme(LocationTheme theme) {
    switch (theme) {
      case LocationTheme.granary:
        return 5;
      case LocationTheme.tavern:
        return 2;
      case LocationTheme.armory:
        return 4;
      case LocationTheme.citadel:
        return 6;
      case LocationTheme.village:
        return 3;
      case LocationTheme.campsite:
        return 1;
    }
  }

  String _statusForRatio(double ratio) {
    if (ratio >= 0.75) return 'Fortified';
    if (ratio >= 0.5) return 'Stable';
    if (ratio >= 0.25) return 'Waning';
    return 'Crumbling';
  }
}
