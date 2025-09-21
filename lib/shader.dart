import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import 'painter.dart'; // this is where ShaderBackground/_ShaderPainter live

class SpaceShader extends StatefulWidget {
  final Widget child;
  const SpaceShader({super.key, required this.child});

  @override
  State<SpaceShader> createState() => _SpaceShaderState();
}

class _SpaceShaderState extends State<SpaceShader>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _currentTime = Duration.zero;

  double _mouseX = 0.0;
  double _mouseY = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      setState(() {
        _currentTime = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return MouseRegion(
          onHover: (PointerHoverEvent e) {
            setState(() {
              _mouseX = e.localPosition.dx;
              _mouseY = height - e.localPosition.dy; // flip Y
            });
          },
          child: ShaderBuilder(assetKey: 'shaders/space.frag', (
            context,
            shader,
            _,
          ) {
            shader.setFloat(0, width); // iResolution.x
            shader.setFloat(1, height); // iResolution.y
            shader.setFloat(2, _currentTime.inMilliseconds / 1000.0); // iTime
            shader.setFloat(3, _mouseX); // iMouse.x
            shader.setFloat(4, _mouseY); // iMouse.y

            return Stack(
              fit: StackFit.expand,
              children: [
                ShaderBackground(shader: shader, width: width, height: height),
                widget.child, // your Flutter UI on top
              ],
            );
          }),
        );
      },
    );
  }
}
