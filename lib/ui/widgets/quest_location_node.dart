import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:envelope/ui/widgets/location_hud.dart';
import 'package:envelope/ui/widgets/spending_input.dart';
import 'package:envelope/blocs/budget_bloc.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/services/haptics_service.dart';
import 'package:envelope/ui/animations/gold_transfer_animation.dart';
import 'package:decimal/decimal.dart';

class QuestLocationNode extends StatelessWidget {
  final QuestLocation location;

  const QuestLocationNode({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return DragTarget<QuestLocation>(
      onAcceptWithDetails: (details) {
        final source = details.data;
        if (source.id != location.id) {
          _showSacrificeDialog(context, source, location, details.offset);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Draggable<QuestLocation>(
          data: location,
          feedback: _buildIcon(isFeedback: true),
          childWhenDragging: Opacity(opacity: 0.3, child: _buildIcon()),
          child: GestureDetector(
            onTap: () => _showLocationDetails(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(isHighlighted: candidateData.isNotEmpty),
                const SizedBox(height: 8),
                _buildLabel(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon({bool isFeedback = false, bool isHighlighted = false}) {
    final iconData = location.isUnderSiege
        ? Icons.pest_control_rodent
        : _getIconForTheme(location.theme);
    var color = location.isUnderSiege ? Colors.redAccent : AppTheme.lifeEssence;

    if (isHighlighted) {
      color = AppTheme.gildedGold;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.midnightVoid.withValues(alpha: isFeedback ? 0.8 : 0.5),
        border: Border.all(color: color, width: isHighlighted ? 4 : 2),
      ),
      child: Stack(
        children: [
          Center(child: Icon(iconData, color: color, size: 40)),
          if (location.isUnderSiege)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                color: Colors.redAccent,
                child: const Text(
                  'UNDER SIEGE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: AppTheme.midnightVoid.withValues(alpha: 0.8),
      child: Text(
        location.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppTheme.rusticParchment,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  IconData _getIconForTheme(LocationTheme theme) {
    switch (theme) {
      case LocationTheme.granary:
        return Icons.grass;
      case LocationTheme.tavern:
        return Icons.local_drink;
      case LocationTheme.armory:
        return Icons.shield;
      case LocationTheme.citadel:
        return Icons.fort;
      case LocationTheme.village:
        return Icons.home;
      case LocationTheme.campsite:
        return Icons.terrain;
    }
  }

  void _showLocationDetails(BuildContext context) {
    HapticsService.tap();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => LocationHUD(
        location: location,
        onSpendRequested: () => _showSpendingInput(context),
      ),
    );
  }

  void _showSpendingInput(BuildContext context) {
    HapticsService.breakSeal();
    showDialog(
      context: context,
      builder: (_) => SpendingInput(
        onConfirm: (amount, desc) {
          context.read<BudgetBloc>().add(SpendMoney(location, amount, desc));
          context.read<KingdomMapBloc>().add(LoadKingdomMap());
          HapticsService.success();
        },
      ),
    );
  }

  void _showSacrificeDialog(
    BuildContext context,
    QuestLocation source,
    QuestLocation target,
    Offset dropOffset,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppTheme.midnightVoid,
        title: Text('SACRIFICE', style: TextStyle(color: AppTheme.gildedGold)),
        content: Text(
          'Sacrifice gold from ${source.name} to reinforce ${target.name}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = Decimal.parse('50');

              // Trigger Animation
              final renderBox = context.findRenderObject() as RenderBox;
              final targetOffset = renderBox.localToGlobal(Offset.zero);
              GoldTransferAnimation.show(context, dropOffset, targetOffset);

              context.read<BudgetBloc>().add(Sacrifice(source, target, amount));
              context.read<KingdomMapBloc>().add(LoadKingdomMap());
              Navigator.pop(context);
              HapticsService.success();
            },
            child: const Text('SACRIFICE'),
          ),
        ],
      ),
    );
  }
}
