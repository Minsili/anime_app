import 'package:flutter/material.dart';

class SizeAnime extends StatelessWidget {
  const SizeAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Size animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
