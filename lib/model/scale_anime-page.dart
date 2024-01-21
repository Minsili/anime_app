import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Switcher animation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 40),
                key: ValueKey(_count),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _count += 1;
                  });
                },
                child: const Text('Add')
            )
          ],
        ),
      ),
    );
  }
}

