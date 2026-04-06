import 'package:flutter/material.dart';
import 'package:envelope/core/theme/app_theme.dart';

class GoldTransferAnimation {
  static void show(BuildContext context, Offset start, Offset end) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => _GoldCoin(start: start, end: end),
    );
    
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 1), () => entry.remove());
  }
}

class _GoldCoin extends StatefulWidget {
  final Offset start;
  final Offset end;

  const _GoldCoin({required this.start, required this.end});

  @override
  State<_GoldCoin> createState() => _GoldCoinState();
}

class _GoldCoinState extends State<_GoldCoin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.start,
      end: widget.end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _positionAnimation,
      builder: (context, child) {
        return Positioned(
          left: _positionAnimation.value.dx,
          top: _positionAnimation.value.dy,
          child: child!,
        );
      },
      child: const Icon(
        Icons.circle,
        color: AppTheme.gildedGold,
        size: 20,
      ),
    );
  }
}
