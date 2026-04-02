import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/ui/animations/map_painter.dart';
import 'package:envelope/ui/widgets/quest_location_node.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/core/theme/app_theme.dart';

class KingdomMapScreen extends StatefulWidget {
  const KingdomMapScreen({super.key});

  @override
  State<KingdomMapScreen> createState() => _KingdomMapScreenState();
}

class _KingdomMapScreenState extends State<KingdomMapScreen> {
  @override
  void initState() {
    super.initState();
    context.read<KingdomMapBloc>().add(LoadKingdomMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<KingdomMapBloc, KingdomMapState>(
        builder: (context, state) {
          if (state is KingdomMapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is KingdomMapLoaded) {
            return Stack(
              children: [
                // Custom Painter Background
                RepaintBoundary(
                  child: CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: MapPainter(state.locations),
                  ),
                ),
                // Nodes
                ...state.locations.map((loc) => _buildNode(context, loc)),
                // Profile Button
                Positioned(
                  top: 48,
                  right: 24,
                  child: FloatingActionButton(
                    heroTag: 'profile',
                    backgroundColor: AppTheme.midnightVoid,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: AppTheme.gildedGold, width: 2),
                    ),
                    onPressed: () => context.push('/profile'),
                    child: const Icon(Icons.person, color: AppTheme.gildedGold),
                  ),
                ),
                // Treasury Button
                Positioned(
                  top: 120,
                  right: 24,
                  child: FloatingActionButton(
                    heroTag: 'treasury',
                    backgroundColor: AppTheme.midnightVoid,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: AppTheme.lifeEssence, width: 2),
                    ),
                    onPressed: () => context.push('/treasury'),
                    child: const Icon(Icons.account_balance_wallet, color: AppTheme.lifeEssence),
                  ),
                ),
              ],
            );
          } else if (state is KingdomMapError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildNode(BuildContext context, QuestLocation location) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: location.x * size.width - 40, // offset for node size
      top: location.y * size.height - 40,
      child: QuestLocationNode(location: location),
    );
  }
}
