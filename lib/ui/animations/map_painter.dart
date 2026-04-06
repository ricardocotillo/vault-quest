import 'package:flutter/material.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/ui/components/tokens.dart';

class MapPainter extends CustomPainter {
  final List<QuestLocation> locations;

  MapPainter(this.locations);

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawConnections(canvas, size);
  }

  void _drawBackground(Canvas canvas, Size size) {
    // Fill with Midnight Void
    final paint = Paint()..color = VQColors.surface;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw some "Alchemist" grid or texture?
    // Let's draw subtle dots for the grid
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 40) {
      for (double j = 0; j < size.height; j += 40) {
        canvas.drawCircle(Offset(i, j), 1, gridPaint);
      }
    }
  }

  void _drawConnections(Canvas canvas, Size size) {
    if (locations.length < 2) return;

    final linePaint = Paint()
      ..color = VQColors.tertiary.withValues(alpha: 0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw lines between locations to form a "Quest Path"
    // For simplicity, connect them in order for now
    for (int i = 0; i < locations.length - 1; i++) {
      final start = Offset(
        locations[i].x * size.width,
        locations[i].y * size.height,
      );
      final end = Offset(
        locations[i + 1].x * size.width,
        locations[i + 1].y * size.height,
      );

      _drawDashedLine(canvas, start, end, linePaint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const dashWidth = 10.0;
    const dashSpace = 5.0;

    final distance = (p2 - p1).distance;
    final direction = (p2 - p1) / distance;

    double currentDistance = 0;
    while (currentDistance < distance) {
      canvas.drawLine(
        p1 + direction * currentDistance,
        p1 + direction * (currentDistance + dashWidth),
        paint,
      );
      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.locations != locations;
  }
}
