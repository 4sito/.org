import 'package:flutter/material.dart';

class Dotted3DTextPainter extends CustomPainter {
  final String text;
  final TextStyle style;
  final Color shadowColor;
  final double offset;
  final double dotSpacing;
  final double dotRadius;

  Dotted3DTextPainter({
    required this.text,
    required this.style,
    this.shadowColor = Colors.red,
    this.offset = 4.0,
    this.dotSpacing = 4.0,
    this.dotRadius = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw main text
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);

    // Draw shadow
    final shadowOffset = Offset(offset, offset);
    final shadowPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(color: shadowColor),
      ),
      textDirection: TextDirection.ltr,
    );
    shadowPainter.layout();
    shadowPainter.paint(canvas, shadowOffset);

    // Draw dots along shadow edge
    final path = Path();
    shadowPainter.paint(canvas, shadowOffset); // optional, already painted
    final width = shadowPainter.width;
    final height = shadowPainter.height;

    final paint = Paint()..color = shadowColor;

    // Draw dots diagonally along the shadow offset
    double x = shadowOffset.dx;
    double y = shadowOffset.dy;
    while (x < width + shadowOffset.dx && y < height + shadowOffset.dy) {
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
      x += dotSpacing;
      y += dotSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
