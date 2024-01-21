import 'package:flutter/material.dart';

class DboxAnime extends StatefulWidget {
  const DboxAnime({Key? key});

  @override
  State<DboxAnime> createState() => _DboxAnimeState();
}

class _DboxAnimeState extends State<DboxAnime> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DecoratedBox animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: _isAnimated
                  ? RadialGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.indigoAccent,
                ],
              )
                  : null,
            ),
            child: FlutterLogo(size: 200),
          ),
        ),
      ),
    );
  }
}