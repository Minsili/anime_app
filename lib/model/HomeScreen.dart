import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var height, width;
   bool isAscending = true;

   List<ContainerModel> containers = [
     ContainerModel('Switcher', '/switcher'),
     ContainerModel('List', '/list'),
     ContainerModel('Position', '/position'),
     ContainerModel('Rotation', '/rotation'),
     ContainerModel('Size', '/size'),
     ContainerModel('Padding', '/padding'),
     ContainerModel('Opacity', '/opacity'),
     ContainerModel('Align', '/align'),
     ContainerModel('CrossFade', '/crossfade'),
     ContainerModel('DecoratedBox', '/decoratedbox'),
   ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (isAscending) {
      containers.sort((a, b) => a.name.compareTo(b.name));
    } else {
      containers.sort((a, b) => b.name.compareTo(a.name));
    }

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
                          onTap: () {
                           setState(() {
                             isAscending = !isAscending;

                           });
                          },
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
                        'Home',
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
                itemCount: containers.length,
                itemBuilder: (BuildContext context, int index) {
                  final randomColor = Color.fromRGBO(
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                    1,
                  );

                  return InkWell(
                    onTap: () {
                      // Handle container tap and navigate to a different page based on the index
                      Navigator.pushNamed(context, containers[index].route);
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
                          containers[index].name, // Display the text for each container
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

class ContainerModel{
  final String name;
  final String route;

  ContainerModel(this.name, this.route);
}
