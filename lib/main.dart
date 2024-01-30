import 'package:anime_app/model/Opacity_anime_page.dart';
import 'package:anime_app/model/PositionTransition_page.dart';
import 'package:anime_app/model/RotationTransition_page.dart';
import 'package:anime_app/model/align_animation_page.dart';
import 'package:anime_app/model/crossFade_page.dart';
import 'package:anime_app/model/list_anime_page.dart';
import 'package:anime_app/model/padding_anime_page.dart';
import 'package:anime_app/model/scale_anime-page.dart';
import 'package:anime_app/model/size_anime_page.dart';
import 'package:anime_app/model/splash_page.dart';
import 'package:flutter/material.dart';

import 'model/HomeScreen.dart';
import 'model/dBox_anime_page.dart';

void main(){
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Welcome(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/switcher': (context) => Switcher(),
        '/list': (context) => ListAnime(),
        '/position': (context) => PositionedTransitionExample(),
        '/rotation': (context) => RotationTransitionExample(),
        '/size': (context) => SizeAnime(),
        '/padding': (context) => PaddingAnime(),
        '/opacity': (context) => OpAnime(),
        '/align': (context) => AlignAnime(),
        '/crossfade': (context) => CrossFadeAnime(),
        '/decoratedbox': (context) => DboxAnime(),
      },
    );
  }
}
