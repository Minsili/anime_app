import 'dart:math';

import 'package:anime_app/model/Opacity_anime_page.dart';
import 'package:anime_app/model/align_animation_page.dart';
import 'package:anime_app/model/scale_anime-page.dart';
import 'package:anime_app/model/size_anime_page.dart';
import 'package:anime_app/model/slid_anime_page.dart';
import 'package:anime_app/model/text_anime_page.dart';
import 'package:flutter/material.dart';

import 'PositionTransition_page.dart';
import 'RotationTransition_page.dart';
import 'crossFade_page.dart';
import 'dBox_anime_page.dart';

class HomeScreen extends StatelessWidget {
  var height, width;

  //const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                    top: 15,
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Choose the animation you want to test',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              height: height * 0.75,
              width: width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 25,
                ),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final randomColor = Color.fromRGBO(
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                    1,
                  );

                  // Define a list of texts for each container
                  final containerTexts = [
                    'Scale',
                    'Slid',
                    'Position',
                    'Rotation',
                    'Size',
                    'Text',
                    'Opacity',
                    'Align',
                    'CrossFade',
                    'DecoratedBox',
                  ];

                  return InkWell(
                    onTap: () {
                      // Handle container tap and navigate to a different page based on the index
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scale(),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Slid(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PositionedTransitionExample(),
                            ),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RotationTransitionExample(),
                            ),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SizeAnime(),
                            ),
                          );
                          break;
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TextAnime(),
                            ),
                          );
                          break;
                        case 6:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OpAnime(),
                            ),
                          );
                          break;
                        case 7:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlignAnime(),
                            ),
                          );
                          break;
                        case 8:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CrossFadeAnime(),
                            ),
                          );
                          break;
                        case 9:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DboxAnime(),
                            ),
                          );
                          break;

                      // Add more cases for each container/page
                      // ...
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: randomColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          containerTexts[index], // Display the text for each container
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
