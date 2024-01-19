import 'package:flutter/material.dart';

class Scale extends StatelessWidget {
  const Scale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Scale animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
