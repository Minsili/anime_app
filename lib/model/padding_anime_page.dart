import 'package:flutter/material.dart';

class PaddingAnime extends StatefulWidget {
  const PaddingAnime({super.key});

  @override
  State<PaddingAnime> createState() => _PaddingAnimeState();
}

class _PaddingAnimeState extends State<PaddingAnime> {
  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Padding animation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                setState(() {
                  padValue = padValue == 0.0 ? 100.0 : 0.0;
                });
              },
              child: Text(
                  'Change padding',
                style: TextStyle(
                  color: Colors.white
                ),
              )
          ),
          Text('Padding = $padValue'),
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
