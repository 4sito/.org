import 'dart:ui';

import 'package:flutter/material.dart';

class ShaderBackground extends StatelessWidget {
  final FragmentShader shader;
  final double width;
  final double height;

  const ShaderBackground({
    super.key,
    required this.shader,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _ShaderPainter(shader),
    );
  }
}

class _ShaderPainter extends CustomPainter {
  final FragmentShader shader;

  _ShaderPainter(this.shader);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant _ShaderPainter oldDelegate) => true;
}
