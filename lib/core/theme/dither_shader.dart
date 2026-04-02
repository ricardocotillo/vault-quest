import 'dart:ui';
import 'package:flutter/material.dart';

class DitherShader extends StatefulWidget {
  final Widget child;
  final Color color1;
  final Color color2;

  const DitherShader({
    super.key,
    required this.child,
    required this.color1,
    required this.color2,
  });

  @override
  State<DitherShader> createState() => _DitherShaderState();
}

class _DitherShaderState extends State<DitherShader> {
  FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    _loadShader();
  }

  Future<void> _loadShader() async {
    try {
      final program = await FragmentProgram.fromAsset('lib/core/theme/dither_shader.frag');
      setState(() {
        _shader = program.fragmentShader();
      });
    } catch (e) {
      debugPrint('Failed to load shader: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_shader == null) return widget.child;

    return CustomPaint(
      painter: _DitherPainter(
        shader: _shader!,
        color1: widget.color1,
        color2: widget.color2,
      ),
      child: widget.child,
    );
  }
}

class _DitherPainter extends CustomPainter {
  final FragmentShader shader;
  final Color color1;
  final Color color2;

  _DitherPainter({
    required this.shader,
    required this.color1,
    required this.color2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, color1.red / 255);
    shader.setFloat(3, color1.green / 255);
    shader.setFloat(4, color1.blue / 255);
    shader.setFloat(5, color2.red / 255);
    shader.setFloat(6, color2.green / 255);
    shader.setFloat(7, color2.blue / 255);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
