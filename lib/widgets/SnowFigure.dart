import 'package:flutter/material.dart';

class SnowFigure extends StatelessWidget{
  final double width;
  final double height;
  final double borderRadius;
  final BoxShadow shadows;
  final Color color;
  final Widget? child;
  const SnowFigure({super.key, required this.borderRadius, required this.width, required this.height, required this.shadows, required this.child, required this.color});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [shadows],
        color: color,
      ), duration: Duration(seconds: 1),
      child: child,
    );
  }
}
