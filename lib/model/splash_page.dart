import 'package:anime_app/model/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    
    Future.delayed(
        Duration(seconds: 5), (){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => HomeScreen(),
              ));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purpleAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(height: 20,),
            Text(
                'AnimesViewer',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                    color: Colors.white,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
