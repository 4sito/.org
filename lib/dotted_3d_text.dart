import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ThreeDTextPage extends StatelessWidget {
  const ThreeDTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Cube(
            onSceneCreated: (Scene scene) {
              final obj = Object(
                scale: Vector3(20.0, 20.0, 20.0),
                rotation: Vector3(0, 0, 0),
                fileName: 'assets/4sito.obj',
                lighting: true,
                mesh: Mesh(colors: [Colors.blue, Colors.black]),
              );

              scene.world.add(obj);
              scene.camera.position.setValues(20, 10, 20);
            },
          ),
        ),
      ),
    );
  }
}
