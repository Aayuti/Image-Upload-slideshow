import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({super.key});

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 3.5,
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 5.0,
        end: 7.5,
      ),
      duration: const Duration(seconds: 3),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Image.asset(
              'assets/images/cover1.png',
              height: 150,
              width: 150,
            ),
          ),
        );
      },
    );
  }
}
