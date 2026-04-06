import 'package:flutter/material.dart';

class StructureCard extends StatelessWidget {
  const StructureCard({
    super.key,
    required this.backgroundColor,
    required this.children,
    this.padding = const EdgeInsets.all(24),
    this.decoration,
  });

  final Color backgroundColor;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration:
          decoration ??
          BoxDecoration(
            color: backgroundColor,
            border: const Border(
              bottom: BorderSide(width: 4, color: Colors.black12),
            ),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
