import 'package:flutter/material.dart';

class OpAnime extends StatefulWidget {
  const OpAnime({Key? key});

  @override
  State<OpAnime> createState() => _OpAnimeState();
}

class _OpAnimeState extends State<OpAnime> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Opacity animation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/image/image_5.png', // Replace with your image path
                width: 400,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
              ),
              child: const Text(
                'Fade Logo',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}