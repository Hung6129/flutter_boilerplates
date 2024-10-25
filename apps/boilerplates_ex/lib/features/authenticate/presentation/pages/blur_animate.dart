import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class BlurAnimated extends StatefulWidget {
  const BlurAnimated({
    super.key,
    required this.childW,
  });

  final Widget childW;

  @override
  State<BlurAnimated> createState() => _BlurAnimatedState();
}

class _BlurAnimatedState extends State<BlurAnimated>
    with TickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this,
  )
    ..forward()
    ..repeat()
    ..repeat(reverse: true);
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this,
  )
    ..forward()
    ..repeat()
    ..repeat(reverse: true);
  late final AnimationController _controller3 = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this,
  )
    ..forward()
    ..repeat()
    ..repeat(reverse: true);

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _controller1.value * 1.5,
              child: child,
            );
          },
          animation: _controller1,
          child: Align(
            alignment: const AlignmentDirectional(20, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purpleAccent),
            ),
          ),
        ),
        AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller2.value * 1 * math.pi,
              child: child,
            );
          },
          animation: _controller2,
          child: Align(
            alignment: const AlignmentDirectional(-2.7, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.3,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.redAccent),
            ),
          ),
        ),
        AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller3.value * 1.5 * math.pi,
              child: child,
            );
          },
          animation: _controller3,
          child: Align(
            alignment: const AlignmentDirectional(2.7, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.3,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.greenAccent),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(),
        ),
        widget.childW,
      ],
    );
  }
}
