import 'package:flutter/material.dart';

class AlignAnime extends StatefulWidget {
  const AlignAnime({super.key});

  @override
  State<AlignAnime> createState() => _AlignAnimeState();
}

class _AlignAnimeState extends State<AlignAnime> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Align animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: Container(
            width: double.infinity,
            height: 250.0,
            color: Colors.blueAccent,
            //Purpose of the AnimatedAlign widget is to animate the transition of the widget
            child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 60,),
            ),
          ),
        ),
      )
    );
  }
}

