import 'package:flutter/material.dart';

class UISpacer extends StatelessWidget {
  final double? width;
  final double? height;

  const UISpacer._({
    this.width,
    this.height,
  });

  factory UISpacer.w({required double dimen}) => UISpacer._(width: dimen);

  factory UISpacer.h({required double dimen}) => UISpacer._(height: dimen);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
