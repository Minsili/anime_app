import 'package:flutter/material.dart';

void main() => runApp(const PositionedTransitionExampleApp());

class PositionedTransitionExampleApp extends StatelessWidget {
  const PositionedTransitionExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PositionedTransitionExample(),
    );
  }
}

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({Key? key}) : super(key: key);

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  static const Color blackWithOpacity = Color(0x4D000000); // 30% opacity

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.repeat(reverse: true); // <-- Start repeating here
  }

  void _stopAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Illustration of Position Transition Animation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size biggest = constraints.biggest;
            return Stack(
              children: <Widget>[
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                      const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                      biggest,
                    ),
                    end: RelativeRect.fromSize(
                      Rect.fromLTWH(
                        biggest.width - bigLogo,
                        biggest.height - bigLogo,
                        bigLogo,
                        bigLogo,
                      ),
                      biggest,
                    ),
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.elasticInOut,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Transform(
                      transform:
                      Matrix4.rotationX(0.5) * Matrix4.rotationY(0.5),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        width: bigLogo,
                        height: bigLogo,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: const [
                            BoxShadow(
                              color: blackWithOpacity,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startAnimation,
              child: const Text('Start'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _stopAnimation,
              child: const Text('Stop'),
            ),
          ],
        ),
      ],
    );
  }
}
