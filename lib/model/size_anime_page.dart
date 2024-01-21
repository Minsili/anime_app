import 'package:flutter/material.dart';

class SizeAnime extends StatefulWidget {
  const SizeAnime({Key? key});

  @override
  State<SizeAnime> createState() => _SizeAnimeState();
}

class _SizeAnimeState extends State<SizeAnime> {
  double _size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Size animation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _size = _size == 200 ? 100 : 200;
          });
        },
        child: Container(
          color: Colors.white38,
          child: Center(
            child: AnimatedSize(
              curve: Curves.easeInCubic,
              duration: const Duration(seconds: 1),
              child: FlutterLogo(size: _size),
            ),
          ),
        ),
      ),
    );
  }
}