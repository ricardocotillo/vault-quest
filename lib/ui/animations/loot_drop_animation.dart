import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:audioplayers/audioplayers.dart';

class LootDropAnimation extends StatefulWidget {
  final Decimal amount;
  final VoidCallback onComplete;

  const LootDropAnimation({
    super.key,
    required this.amount,
    required this.onComplete,
  });

  @override
  State<LootDropAnimation> createState() => _LootDropAnimationState();
}

class _LootDropAnimationState extends State<LootDropAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
    );

    _playFanfare();
    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), widget.onComplete);
    });
  }

  Future<void> _playFanfare() async {
    // In a real app, we would have a local asset.
    // For this prototype, we'll assume it exists or fail silently.
    try {
      // await _audioPlayer.play(AssetSource('sounds/fanfare.mp3'));
    } catch (_) {}
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.8),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: 1.0 - _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: AppTheme.gildedGold,
                      size: 80,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'HARVEST COMPLETE',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppTheme.gildedGold,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '+${widget.amount} GOLD',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.lifeEssence,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'TREASURY SECURED',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.rusticParchment.withValues(alpha: 0.7),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
