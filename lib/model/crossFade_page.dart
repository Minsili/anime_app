import 'package:flutter/material.dart';

class CrossFadeAnime extends StatefulWidget {
  const CrossFadeAnime({super.key});

  @override
  State<CrossFadeAnime> createState() => _CrossFadeAnimeState();
}

class _CrossFadeAnimeState extends State<CrossFadeAnime> {
  bool _val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CrossFade animation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _val = !_val;
                });
              },
              child: Text(
                  'Swicth',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
              ),
          ),
          AnimatedCrossFade(
              firstChild: Image.asset(
                'assets/image/image_3.jpg',
                width: double.infinity,
              ),
              secondChild: Image.asset(
                'assets/image/image_1.jpg',
                width: double.infinity,
              ),
              crossFadeState:
                  _val ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}

