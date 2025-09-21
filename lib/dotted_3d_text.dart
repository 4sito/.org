import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

// obj dimensions
final height = 25.0;
final width = 15.0;
final depth = 15.0;

// obj perspective
final horizontal =
    15.0; // negative -> counteclockwise, positive -> clockwise rotation
final vertical = 0.0;
final distance = 12.0;

class ThreeDTextPage extends StatelessWidget {
  const ThreeDTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    log("screensize: ${screenSize.width} ${screenSize.height}");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Focus(
            canRequestFocus: false, // prevent key events
            child: Cube(
              interactive: false,
              onSceneCreated: (Scene scene) {
                final obj = Object(
                  scale: Vector3(width, height, depth),
                  fileName: 'assets/4sito.obj',
                  lighting: true,
                );
                scene.world.add(obj);
                // scene.camera.zoom = 1.2;
                scene.camera.position.setValues(horizontal, vertical, distance);
              },
            ),
          ),
        ),
      ),
    );
  }
}
