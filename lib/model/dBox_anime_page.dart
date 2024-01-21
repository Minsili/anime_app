import 'package:flutter/material.dart';

class DboxAnime extends StatefulWidget {
  const DboxAnime({super.key});

  @override
  State<DboxAnime> createState() => _DboxAnimeState();
}

class _DboxAnimeState extends State<DboxAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
        child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: <Color>[
                    Colors.deepPurple,
                    Colors.indigoAccent,
                  ]
              )
            )
        ),
      ),
    );
  }
}

