import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration = const Duration(milliseconds: 80);
  final double opacity = 0.5;

  const TouchableOpacity({super.key, required this.child, this.onTap});

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
  }

  bool get isEnable => widget.onTap != null && context.mounted;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnable,
      child: GestureDetector(
        onTapDown: isEnable ? _onTapDown : null,
        onTapUp: isEnable ? _onTapUp : null,
        onTapCancel: isEnable ? _onTapCancel : null,
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedSize(
          duration: widget.duration,
          child: AnimatedOpacity(
            duration: widget.duration,
            opacity: isDown ? widget.opacity : 1,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _onTapCancel() {
    if (mounted) {
      setState(() => isDown = false);
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (isDown) {
      Future.delayed(widget.duration)
          .whenComplete(() => setState(() => isDown = false));
    } else {
      if (mounted) {
        setState(() => isDown = false);
      }
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      setState(() => isDown = true);
    }
  }
}
