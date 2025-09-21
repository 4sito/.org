import 'package:_4sito/dotted_3d_text.dart';
import 'package:_4sito/shader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '4sito.org'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // with SingleTickerProviderStateMixin
  // late Ticker _ticker;
  // Duration _currentTime = Duration.zero;

  // final double _mouseX = 0.0;
  // final double _mouseY = 0.0;

  @override
  void initState() {
    super.initState();
    // _ticker = createTicker((Duration elapsed) {
    //   setState(() {
    //     _currentTime = elapsed;
    //   });
    // });
    // _ticker.start();
  }

  @override
  void dispose() {
    // _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpaceShader(
        child: ThreeDTextPage(),
        // child: SizedBox(),
      ),
    );
  }
}
