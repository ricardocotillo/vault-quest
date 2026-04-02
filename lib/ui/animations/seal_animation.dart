import 'package:flutter/material.dart';
import 'package:envelope/core/theme/app_theme.dart';

class SealAnimation extends StatefulWidget {
  final VoidCallback onComplete;

  const SealAnimation({super.key, required this.onComplete});

  @override
  State<SealAnimation> createState() => _SealAnimationState();
}

class _SealAnimationState extends State<SealAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void breakSeal() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: breakSeal,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            ),
          );
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.lock,
              color: AppTheme.gildedGold,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
